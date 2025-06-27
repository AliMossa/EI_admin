import 'package:admin_dashboard/presentations/auth/domain/entities/verify_code_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class VerifyCodeDataSource {
  Future<String> verifyCode(VerifyCodeEntity verifyCodeEntity);
}

class VerifyCodeDataSourceWithDio extends VerifyCodeDataSource {
  VerifyCodeDataSourceWithDio? _verifycodeDataSourceWithDio;
  VerifyCodeDataSourceWithDio get() =>
      _verifycodeDataSourceWithDio ??
      (_verifycodeDataSourceWithDio = VerifyCodeDataSourceWithDio());
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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
