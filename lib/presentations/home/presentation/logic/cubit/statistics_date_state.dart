part of 'statistics_date_cubit.dart';

sealed class StatisticsDateState extends Equatable {
  const StatisticsDateState();

  @override
  List<Object> get props => [];
}

final class StatisticsDateInitial extends StatisticsDateState {}

class LoadingSetStatisticsDateState extends StatisticsDateState {}

class SetStatisticsDateState extends StatisticsDateState {}
