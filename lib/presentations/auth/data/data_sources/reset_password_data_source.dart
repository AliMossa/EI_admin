import 'dart:developer';

import 'package:admin_dashboard/presentations/auth/domain/entities/reset_password_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ResetPasswordDataSource {
  Future<String> resetPassoword(ResetPasswordEntity resetPasswordEntity);
}

class ResetPasswordDataSourceWithDio extends ResetPasswordDataSource {
  @override
  Future<String> resetPassoword(ResetPasswordEntity resetPasswordEntity) async {
    String message = '';

    try {
      final response = await Apis().post(
        NetworkApisRouts().getresetForgottenPasswordApi(),
        FormData.fromMap({
          'email': resetPasswordEntity.email,
          'password': resetPasswordEntity.newPassword,
          'password_confirmation': resetPasswordEntity.confirmNewPassword,
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
      log('ClientAdminError: ${error.message}', name: 'ResetPassword');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ResetPassword');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ResetPassword',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
