import 'package:admin_dashboard/presentations/auth/domain/entities/auth_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:dio/dio.dart';

abstract class LoginDataSource {
  Future<ResponseAuthEntity> login(AuthEntity auth);
}

class LoginDataSourceWithDio extends LoginDataSource {
  LoginDataSourceWithDio? _dataSourceWithDio;
  LoginDataSourceWithDio get() =>
      _dataSourceWithDio ?? (_dataSourceWithDio = LoginDataSourceWithDio());
  @override
  Future<ResponseAuthEntity> login(AuthEntity auth) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().getLoginApi(),
        FormData.fromMap({'email': auth.email, 'password': auth.password}),
        '',
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      if (response['data']['role_id'] != 1) {
        message = 'You don\'t have premisstions';
        throw Exception(message);
      }
      return ResponseAuthEntity(message: message, token: response['token']);
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
