part of 'monitoring_history_bloc.dart';

sealed class MonitoringHistoryEvent extends Equatable {
  const MonitoringHistoryEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetMonitoringHistoryEvent extends MonitoringHistoryEvent {
  int id;
  GetMonitoringHistoryEvent({required this.id});
}

class ReGetMonitoringHistoryEvent extends MonitoringHistoryEvent {}
