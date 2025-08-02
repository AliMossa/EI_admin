import 'dart:developer';

import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class UnActiveEmployeeDataSource {
  Future<String> unActiveEmployee(ActiveUserEntity activeUserEntity);
}

class UnActiveEmployeeDataSourceWithDio extends UnActiveEmployeeDataSource {
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
      log('ClientAdminError: ${error.message}', name: 'UnActiveEmployee');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'UnActiveEmployee');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'UnActiveEmployee',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
