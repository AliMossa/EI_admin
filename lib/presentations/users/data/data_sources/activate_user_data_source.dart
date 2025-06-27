import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class ActivateUserDataSource {
  Future<String> activateUser(ActivateUserEntity activateUserEntity);
}

class ActivateUserDataSourceWithDio extends ActivateUserDataSource {
  ActivateUserDataSourceWithDio? _activateUserDataSourceWithDio;
  ActivateUserDataSourceWithDio get() =>
      _activateUserDataSourceWithDio ??
      (_activateUserDataSourceWithDio = ActivateUserDataSourceWithDio());

  @override
  Future<String> activateUser(ActivateUserEntity activateUserEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().activeUserApi()}${activateUserEntity.id}',
        FormData.fromMap({}),
        activateUserEntity.token,
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
