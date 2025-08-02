import 'dart:developer';

import 'package:admin_dashboard/presentations/auth/domain/entities/verify_code_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class VerifyCodeDataSource {
  Future<String> verifyCode(VerifyCodeEntity verifyCodeEntity);
}

class VerifyCodeDataSourceWithDio extends VerifyCodeDataSource {
  @override
  Future<String> verifyCode(VerifyCodeEntity verifyCodeEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().getverifyVerificationCodeApi(),
        FormData.fromMap({
          'email': verifyCodeEntity.email,
          'verification_code': verifyCodeEntity.code,
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
      log('ClientAdminError: ${error.message}', name: 'VerifyCode');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'VerifyCode');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'VerifyCode',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
