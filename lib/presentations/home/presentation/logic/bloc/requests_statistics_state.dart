part of 'requests_statistics_bloc.dart';

sealed class RequestsStatisticsState extends Equatable {
  const RequestsStatisticsState();

  @override
  List<Object> get props => [];
}

final class RequestsStatisticsInitial extends RequestsStatisticsState {}

class LoadingGetAllRequestsStatisticsState extends RequestsStatisticsState {}

class SuccessGetAllRequestsStatisticsState extends RequestsStatisticsState {}

// ignore: must_be_immutable
class FailedGetAllRequestsStatisticsState extends RequestsStatisticsState {
  String message;
  FailedGetAllRequestsStatisticsState({required this.message});
}
