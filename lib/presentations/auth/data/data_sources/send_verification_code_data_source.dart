import 'dart:developer';

import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class SendVerificationCodeDataSource {
  Future<String> sendVerificationCode(String email);
}

class SendVerificationCodeDataSourceWithDio
    extends SendVerificationCodeDataSource {
  @override
  Future<String> sendVerificationCode(String email) async {
    String message = "";
    try {
      final response = await Apis().post(
        NetworkApisRouts().getsendVerificationCodeApi(),
        FormData.fromMap({'email': email}),
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
      log('ClientAdminError: ${error.message}', name: 'SendVerificationCode');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'SendVerificationCode');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'SendVerificationCode',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
