import 'dart:developer';

import 'package:admin_dashboard/presentations/auth/domain/entities/auth_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:dio/dio.dart';

abstract class LoginDataSource {
  Future<ResponseAuthEntity> login(AuthEntity auth);
}

class LoginDataSourceWithDio extends LoginDataSource {
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
      log('ClientAdminError: ${error.message}', name: 'Login');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'Login');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log('Unhandled Exception: $error', stackTrace: stackTrace, name: 'Login');
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
