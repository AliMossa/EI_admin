import 'dart:developer';

import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class RejectRequestDataSource {
  Future<String> rejectRequest(RequestManagmentEntity requestManagmentEntity);
}

class RejectRequestDataSourceWithDio extends RejectRequestDataSource {
  @override
  Future<String> rejectRequest(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    String message = '';
    try {
      print(requestManagmentEntity.notice);
      final response = await Apis().post(
        '${NetworkApisRouts().rejextPropertyRequestApi()}${requestManagmentEntity.id}',
        FormData.fromMap({'note_admin': requestManagmentEntity.notice}),
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
      log('ClientAdminError: ${error.message}', name: 'RejectRequest');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'RejectRequest');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'RejectRequest',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
