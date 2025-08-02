import 'dart:developer';

import 'package:admin_dashboard/presentations/profile/domain/entities/logs_request_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetProfileLogsDataSource {
  Future<TotalProfileLogsEntity> getProfileLogs(
    LogsRequestEntity logsRequestEntity,
  );
}

class GetProfileLogsDataSourceWithDio extends GetProfileLogsDataSource {
  @override
  Future<TotalProfileLogsEntity> getProfileLogs(
    LogsRequestEntity logsRequestEntity,
  ) async {
    String message = '';
    TotalProfileLogsEntity result = TotalProfileLogsEntity.init();

    try {
      final response = await Apis().get(
        '${NetworkApisRouts().getUserLogsApi()}${logsRequestEntity.id}',
        {},
        logsRequestEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      print(response);
      for (Map<String, dynamic> item in response['data']['logs']) {
        result.list.add(
          ProfileLogsEntity(
            level: item['level'],
            message: item['message'],
            time: item['record_datetime'],
          ),
        );
      }
      result.nextPage = response['data']['pagination']['next_page_url'] ?? '';
      return result;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetProfileLogs');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetProfileLogs');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetProfileLogs',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
