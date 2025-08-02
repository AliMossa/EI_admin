import 'dart:developer';

import 'package:admin_dashboard/presentations/profile/domain/entities/update_enitity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class UpdateProfileInfoDataSource {
  Future<String> updateProfileInfo(UpdateEnitity updateEnitity, String token);
}

class UpdateProfileInfoDataSourceWithDio extends UpdateProfileInfoDataSource {
  @override
  Future<String> updateProfileInfo(
    UpdateEnitity updateEnitity,
    String token,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().updateProfileInfoApi(),
        FormData.fromMap({
          if (updateEnitity.email.isNotEmpty) 'email': updateEnitity.email,
          if (updateEnitity.phone.isNotEmpty) 'phone': updateEnitity.phone,
          if (updateEnitity.image != null)
            'personal_photo': updateEnitity.image,
        }),
        token,
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'UpdateProfileInfo');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'UpdateProfileInfo');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'UpdateProfileInfo',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
