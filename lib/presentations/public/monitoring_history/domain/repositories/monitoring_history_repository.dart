import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/logs_get_request_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/total_logs_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class MonitoringHistoryRepository {
  Future<Either<AdminExceptions, TotalLogsEntity>> getLogs(
    LogsGetRequestEntity logsRequest,
  );
}
