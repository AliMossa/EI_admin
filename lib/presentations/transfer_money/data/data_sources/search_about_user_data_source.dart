import 'dart:developer';

import 'package:admin_dashboard/presentations/transfer_money/domain/entities/about_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class SearchAboutUserDataSource {
  Future<AboutUserEntity> searchAboutuser(String email);
}

class SearchAboutUserDataSourceWithDio extends SearchAboutUserDataSource {
  @override
  Future<AboutUserEntity> searchAboutuser(String email) async {
    String message = '';
    try {
      final response = await Apis().post(
        NetworkApisRouts().getSearchAboutUser(),
        FormData.fromMap({'email': email}),
        '',
      );
      final item = response['data'][0];
      return AboutUserEntity(
        userId: item['user_id'],
        name: item['name'],
        email: item['email'],
        phone: item['phone'],
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'SearchAboutUser');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'SearchAboutUser');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'SearchAboutUser',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
