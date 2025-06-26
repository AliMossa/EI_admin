part of 'success_statistics_bloc.dart';

sealed class SuccessStatisticsEvent extends Equatable {
  const SuccessStatisticsEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetSuccessStatisticsEvent extends SuccessStatisticsEvent {
  int year;
  GetSuccessStatisticsEvent({required this.year});
}
