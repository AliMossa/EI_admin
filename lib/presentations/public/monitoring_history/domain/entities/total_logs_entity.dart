import 'package:admin_dashboard/presentations/public/monitoring_history/domain/entities/logs_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalLogsEntity extends Equatable {
  List<LogsEntity> logs;
  String? nextPage;
  TotalLogsEntity({required this.logs, required this.nextPage});
  factory TotalLogsEntity.init() => TotalLogsEntity(logs: [], nextPage: '');
  @override
  List<Object?> get props => [logs, nextPage];
}
