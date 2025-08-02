import 'dart:developer';

import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class UnActiveUserDataSrouce {
  Future<String> unActivateUser(ActivateUserEntity activateUser);
}

class UnActiveUserDataSrouceWithDio extends UnActiveUserDataSrouce {
  @override
  Future<String> unActivateUser(ActivateUserEntity activateUserEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().unActiveUserApi()}${activateUserEntity.id}',
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
      log('ClientAdminError: ${error.message}', name: 'UnActiveUser');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'UnActiveUser');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'UnActiveUser',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
