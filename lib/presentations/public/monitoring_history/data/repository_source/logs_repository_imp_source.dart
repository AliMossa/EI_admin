import 'package:admin_dashboard/presentations/public/monitoring_history/data/data_source/get_logs_data_source.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/logs_get_request_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/total_logs_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/repositories/monitoring_history_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class LogsRepositoryImpSource implements MonitoringHistoryRepository {
  @override
  Future<Either<AdminExceptions, TotalLogsEntity>> getLogs(
    LogsGetRequestEntity logsRequest,
  ) async {
    try {
      return right(await GetLogsDataSourceWithDio().get().getLogs(logsRequest));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
