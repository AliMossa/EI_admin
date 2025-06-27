import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class LogoutDataSource {
  Future<String> logout(String token);
}

class LogoutDataSourceWithDio extends LogoutDataSource {
  LogoutDataSourceWithDio? _dataSourceWithDio;
  LogoutDataSourceWithDio get() =>
      _dataSourceWithDio ?? (_dataSourceWithDio = LogoutDataSourceWithDio());

  @override
  Future<String> logout(String token) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().getLogoutApi(),
        FormData.fromMap({}),
        token,
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
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
