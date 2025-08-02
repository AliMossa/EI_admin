import 'dart:developer';

import 'package:admin_dashboard/presentations/users/domain/entities/add_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class AddUserDataSource {
  Future<String> addUser(AddUserEntity addUserEntity);
}

class AddUserDataSourceWithDio extends AddUserDataSource {
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

      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetCommonQuestions');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetCommonQuestions');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetCommonQuestions',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
