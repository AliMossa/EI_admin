import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/total_logs_entity.dart';

class MonitoringHistoryMiddleware {
  TotalLogsEntity _logsEntity = TotalLogsEntity.init();
  void setTotalLogsEntity(TotalLogsEntity newTotalLogsEntity) {
    _logsEntity.logs = newTotalLogsEntity.logs;
    _logsEntity.nextPage = _logsEntity.nextPage;
  }

  TotalLogsEntity getTotalLogsEntity() => _logsEntity;
}
