import 'dart:developer';

import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetProfileInfoDataSource {
  Future<ProfileEntity> getProfileInfo(String token);
}

class GetProfileInfoDataSourceWithDio extends GetProfileInfoDataSource {
  @override
  Future<ProfileEntity> getProfileInfo(String token) async {
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getProfileInfoApi(),
        {},
        token,
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return ProfileEntity(
        id: response['data']['id'],
        roleId: response['data']['role_id'],
        name: response['data']['name'],
        email: response['data']['email'],
        phone: response['data']['phone'],
        joindedDate: DateFormat(
          'MMMM d, y',
        ).format(DateTime.parse(response['data']['created_at'])),
        pesonalPhoto: response['data']['personal_photo'] ?? '',
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetProfileInfo');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetProfileInfo');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetProfileInfo',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
