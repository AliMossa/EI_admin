part of 'monitoring_history_bloc.dart';

sealed class MonitoringHistoryState extends Equatable {
  const MonitoringHistoryState();

  @override
  List<Object> get props => [];
}

final class MonitoringHistoryInitial extends MonitoringHistoryState {}

class LoadingGetMonitoringHistoryState extends MonitoringHistoryState {}

class SuccessGetMonitoringHistoryState extends MonitoringHistoryState {}

// ignore: must_be_immutable
class FailedGetMonitoringHistoryState extends MonitoringHistoryState {
  String message;
  FailedGetMonitoringHistoryState({required this.message});
}
