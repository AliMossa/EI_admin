import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/logs_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/logs_get_request_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/total_logs_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class GetLogsDataSource {
  Future<TotalLogsEntity> getLogs(LogsGetRequestEntity logsGetRequestEntity);
}

class GetLogsDataSourceWithDio extends GetLogsDataSource {
  GetLogsDataSourceWithDio? _getLogsDataSourceWithDio;
  GetLogsDataSourceWithDio get() =>
      _getLogsDataSourceWithDio ??
      (_getLogsDataSourceWithDio = GetLogsDataSourceWithDio());

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
      return TotalLogsEntity(
        logs: list,
        nextPage: response['data']['pagination']['next_page_url'],
      );
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
