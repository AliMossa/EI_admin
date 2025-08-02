import 'dart:developer';

import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class AcceptRequestDataSource {
  Future<String> acceptRequest(RequestManagmentEntity requestManagmentEntity);
}

class AcceptRequestDataSourceWithDio extends AcceptRequestDataSource {
  @override
  Future<String> acceptRequest(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().acceptPropertyRequestApi()}${requestManagmentEntity.id}',
        FormData.fromMap({}),
        requestManagmentEntity.token,
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'AcceptRequest');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'AcceptRequest');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'AcceptRequest',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
