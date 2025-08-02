import 'dart:developer';

import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ActiveEmployeeDataSource {
  Future<String> activeEmployee(ActiveUserEntity activeUserEntity);
}

class ActiveEmployeeDataSourceWithDio extends ActiveEmployeeDataSource {
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
      log('ClientAdminError: ${error.message}', name: 'ActiveEmployee');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ActiveEmployee');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ActiveEmployee',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
