import 'dart:developer';

import 'package:admin_dashboard/presentations/profile/domain/entities/profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ReGetProfileLogsDataSource {
  Future<TotalProfileLogsEntity> reGetProfileLogs(String link);
}

class ReGetProfileLogsDataSourceWithDio extends ReGetProfileLogsDataSource {
  @override
  Future<TotalProfileLogsEntity> reGetProfileLogs(String link) async {
    String message = '';
    TotalProfileLogsEntity result = TotalProfileLogsEntity.init();

    try {
      final response = await Apis().get(link, {}, '');
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']['logs']) {
        result.list.add(
          ProfileLogsEntity(
            level: item['level'],
            message: item['message'],
            time: item['record_datetime'],
          ),
        );
      }
      result.nextPage = response['data']['pagination']['next_page_url'];
      return result;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ReGetProfileLogs');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ReGetProfileLogs');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ReGetProfileLogs',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
