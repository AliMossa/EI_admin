import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class ActiveEmployeeDataSource {
  Future<String> activeEmployee(ActiveUserEntity activeUserEntity);
}

class ActiveEmployeeDataSourceWithDio extends ActiveEmployeeDataSource {
  ActiveEmployeeDataSourceWithDio? _activeEmployeeDataSourceWithDio;
  ActiveEmployeeDataSourceWithDio get() =>
      _activeEmployeeDataSourceWithDio ??
      (_activeEmployeeDataSourceWithDio = ActiveEmployeeDataSourceWithDio());

  @override
  Future<String> activeEmployee(ActiveUserEntity activeUserEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().activeUserApi()}${activeUserEntity.id}',
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
