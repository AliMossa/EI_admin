import 'package:admin_dashboard/presentations/settings/domain/entities/change_password_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class ChangePasswordDataSource {
  Future<String> changePassword(ChangePasswordEntity changePasswordEntity);
}

class ChangePasswordDataSourceWithDio extends ChangePasswordDataSource {
  ChangePasswordDataSourceWithDio? _changePasswordDataSourceWithDio;
  ChangePasswordDataSourceWithDio get() =>
      _changePasswordDataSourceWithDio ??
      (_changePasswordDataSourceWithDio = ChangePasswordDataSourceWithDio());

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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
