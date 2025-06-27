part of 'requests_statistics_bloc.dart';

sealed class RequestsStatisticsEvent extends Equatable {
  const RequestsStatisticsEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetAllRequestsStatisticsEvent extends RequestsStatisticsEvent {
  int year;
  GetAllRequestsStatisticsEvent({required this.year});
}
