import 'dart:developer';

import 'package:admin_dashboard/presentations/settings/domain/entities/change_password_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ChangePasswordDataSource {
  Future<String> changePassword(ChangePasswordEntity changePasswordEntity);
}

class ChangePasswordDataSourceWithDio extends ChangePasswordDataSource {
  @override
  Future<String> changePassword(
    ChangePasswordEntity changePasswordEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().getresetForgottenPasswordApi(),
        FormData.fromMap({
          'email': changePasswordEntity.email,
          'password': changePasswordEntity.password,
          'password_confirmation': changePasswordEntity.confirmPassword,
        }),
        '',
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ChangePassword');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ChangePassword');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ChangePassword',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
