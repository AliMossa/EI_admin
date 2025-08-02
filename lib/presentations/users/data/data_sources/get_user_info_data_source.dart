import 'dart:developer';

import 'package:admin_dashboard/presentations/users/domain/entities/get_user_info_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetUserInfoDataSource {
  Future<UserEntity> getUserInfo(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  );
}

class GetUserInfoDataSourceWithDio extends GetUserInfoDataSource {
  @override
  Future<UserEntity> getUserInfo(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().get(
        '${NetworkApisRouts().viewEmployeeApi()}${getUserInfoRequestEntity.id}',
        {},
        getUserInfoRequestEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      Map<String, dynamic> item = response['data'];

      return UserEntity(
        id: item['id'],
        fullName: item['name'],
        email: item['email'],
        phone: item['phone'],
        loggedIn: '',
        isActive: item['active'] == 1 ? true : false,
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetUserInfo');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetUserInfo');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetUserInfo',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
