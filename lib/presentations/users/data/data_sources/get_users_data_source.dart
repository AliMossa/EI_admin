import 'dart:developer';

import 'package:admin_dashboard/presentations/users/domain/entities/get_user_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetUsersDataSource {
  Future<TotalUserEntity> getUsers(GetUserRequestEntity getUserRequestEntity);
}

class GetUsersDataSourceWithDio extends GetUsersDataSource {
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
      log('ClientAdminError: ${error.message}', name: 'GetUsers');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetUsers');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetUsers',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
