import 'package:admin_dashboard/presentations/home/domain/entities/request_requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class GetRequestsStatisticsDataSource {
  Future<RequestsStatisticsEntity> getRequestsStatistics(
    RequestRequestsStatisticsEntity requestRequestsStatisticsEntity,
  );
}

class GetRequestsStatisticsDataSourceWithDio
    extends GetRequestsStatisticsDataSource {
  GetRequestsStatisticsDataSource? _getRequestsStatisticsDataSource;
  GetRequestsStatisticsDataSource get() =>
      _getRequestsStatisticsDataSource ??
      (_getRequestsStatisticsDataSource =
          GetRequestsStatisticsDataSourceWithDio());
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
        acceptedByAdmin: response['accepted_by_admin_percentage'],
        rejectedByLawyer: response['rejected_by_lawyer_percentage'],
        rejectedByUser: response['rejected_by_user_percentage'],
      );
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
