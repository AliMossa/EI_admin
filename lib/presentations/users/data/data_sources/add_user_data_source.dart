import 'package:admin_dashboard/presentations/users/domain/entities/add_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class AddUserDataSource {
  Future<String> addUser(AddUserEntity addUserEntity);
}

class AddUserDataSourceWithDio extends AddUserDataSource {
  AddUserDataSourceWithDio? _addUserDataSourceWithDio;
  AddUserDataSourceWithDio get() =>
      _addUserDataSourceWithDio ??
      (_addUserDataSourceWithDio = AddUserDataSourceWithDio());

  @override
  Future<String> addUser(AddUserEntity addUserEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().addUserApi(),
        FormData.fromMap({
          'name': addUserEntity.name,
          'email': addUserEntity.email,
          'password': addUserEntity.password,
          'password_confirmation': addUserEntity.confirmPassword,
          'role_id': 2,
          'phone': addUserEntity.phone,
        }),
        '',
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      print(message);
      return message;
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
