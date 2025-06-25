import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class SendVerificationCodeDataSource {
  Future<String> sendVerificationCode(String email);
}

class SendVerificationCodeDataSourceWithDio
    extends SendVerificationCodeDataSource {
  SendVerificationCodeDataSourceWithDio? _sendVerificationCodeDataSourceWithDio;
  SendVerificationCodeDataSourceWithDio get() =>
      _sendVerificationCodeDataSourceWithDio ??
      (_sendVerificationCodeDataSourceWithDio =
          SendVerificationCodeDataSourceWithDio());
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
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
