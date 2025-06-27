import 'package:admin_dashboard/presentations/users/domain/entities/get_user_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetUsersDataSource {
  Future<TotalUserEntity> getUsers(GetUserRequestEntity getUserRequestEntity);
}

class GetUsersDataSourceWithDio extends GetUsersDataSource {
  GetUsersDataSourceWithDio? _getUsersDataSourceWithDio;
  GetUsersDataSourceWithDio get() =>
      _getUsersDataSourceWithDio ??
      (_getUsersDataSourceWithDio = GetUsersDataSourceWithDio());

  @override
  Future<TotalUserEntity> getUsers(
    GetUserRequestEntity getUserRequestEntity,
  ) async {
    String message = '';
    List<UserEntity> list = [];
    try {
      final response = await Apis().post(
        NetworkApisRouts().getEmployeesApi(),
        FormData.fromMap({'role_id': 2, 'active': getUserRequestEntity.active}),
        getUserRequestEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']) {
        list.add(
          UserEntity(
            id: item['id'],
            fullName: item['name'],
            email: item['email'],
            phone: item['phone'],
            loggedIn: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['created_at']),
            ),
          ),
        );
      }
      return TotalUserEntity(users: list, nextPage: '');
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
