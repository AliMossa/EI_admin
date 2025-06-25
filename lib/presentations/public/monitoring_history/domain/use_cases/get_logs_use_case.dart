import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/logs_get_request_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/total_logs_entity.dart';
import 'package:admin_dashboard/presentations/public/monitoring_history/domain/repositories/monitoring_history_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetLogsUseCase {
  MonitoringHistoryRepository monitoringHistoryRepository;
  GetLogsUseCase({required this.monitoringHistoryRepository});
  Future<Either<AdminExceptions, TotalLogsEntity>> call(
    LogsGetRequestEntity logsRequest,
  ) async {
    return await monitoringHistoryRepository.getLogs(logsRequest);
  }
}
