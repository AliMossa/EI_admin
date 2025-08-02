import 'dart:developer';

import 'package:admin_dashboard/presentations/home/domain/entities/request_requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetRequestsStatisticsDataSource {
  Future<RequestsStatisticsEntity> getRequestsStatistics(
    RequestRequestsStatisticsEntity requestRequestsStatisticsEntity,
  );
}

class GetRequestsStatisticsDataSourceWithDio
    extends GetRequestsStatisticsDataSource {
  @override
  Future<RequestsStatisticsEntity> getRequestsStatistics(
    RequestRequestsStatisticsEntity requestRequestsStatisticsEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().getRequestsStatisticsApi(),
        FormData.fromMap({'year': requestRequestsStatisticsEntity.year}),
        requestRequestsStatisticsEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return RequestsStatisticsEntity(
        acceptedByAdmin: response['accepted_by_admin_percentage'] * 1.0,
        rejectedByLawyer: response['rejected_by_lawyer_percentage'] * 1.0,
        rejectedByUser: response['rejected_by_user_percentage'] * 1.0,
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetRequestsStatistics');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetRequestsStatistics');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetRequestsStatistics',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
