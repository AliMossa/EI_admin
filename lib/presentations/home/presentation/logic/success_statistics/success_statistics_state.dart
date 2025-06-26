part of 'success_statistics_bloc.dart';

sealed class SuccessStatisticsState extends Equatable {
  const SuccessStatisticsState();

  @override
  List<Object> get props => [];
}

final class SuccessStatisticsInitial extends SuccessStatisticsState {}

class LoadingGetSuccessStatisticsState extends SuccessStatisticsState {}

class SuccessGetSuccessStatisticsState extends SuccessStatisticsState {}

// ignore: must_be_immutable
class FailedGetSuccessStatisticsState extends SuccessStatisticsState {
  String message;
  FailedGetSuccessStatisticsState({required this.message});
}
