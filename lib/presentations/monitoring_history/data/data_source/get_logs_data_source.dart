import 'dart:developer';

import 'package:admin_dashboard/presentations/monitoring_history/domain/entities/logs_entity.dart';
import 'package:admin_dashboard/presentations/monitoring_history/domain/entities/logs_get_request_entity.dart';
import 'package:admin_dashboard/presentations/monitoring_history/domain/entities/total_logs_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetLogsDataSource {
  Future<TotalLogsEntity> getLogs(LogsGetRequestEntity logsGetRequestEntity);
}

class GetLogsDataSourceWithDio extends GetLogsDataSource {
  @override
  Future<TotalLogsEntity> getLogs(
    LogsGetRequestEntity logsGetRequestEntity,
  ) async {
    String message = '';
    List<LogsEntity> list = [];
    try {
      final response = await Apis().get(
        '${NetworkApisRouts().getUserLogsApi()}${logsGetRequestEntity.id}',
        {},
        logsGetRequestEntity.token,
      );
      for (Map<String, dynamic> item in response['data']['logs']) {
        list.add(
          LogsEntity(
            message: item['message'],
            level: item['level'],
            time: item['record_datetime'],
          ),
        );
      }
      print(response);
      return TotalLogsEntity(
        logs: list,
        nextPage: response['data']['pagination']['next_page_url'],
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetProperties');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetProperties');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetProperties',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
