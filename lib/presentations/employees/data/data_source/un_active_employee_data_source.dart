import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class UnActiveEmployeeDataSource {
  Future<String> unActiveEmployee(ActiveUserEntity activeUserEntity);
}

class UnActiveEmployeeDataSourceWithDio extends UnActiveEmployeeDataSource {
  UnActiveEmployeeDataSourceWithDio? _unActiveEmployeeDataSourceWithDio;
  UnActiveEmployeeDataSourceWithDio get() =>
      _unActiveEmployeeDataSourceWithDio ??
      (_unActiveEmployeeDataSourceWithDio =
          UnActiveEmployeeDataSourceWithDio());

  @override
  Future<String> unActiveEmployee(ActiveUserEntity activeUserEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().unActiveUserApi()}${activeUserEntity.id}',
        FormData.fromMap({}),
        activeUserEntity.token,
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
