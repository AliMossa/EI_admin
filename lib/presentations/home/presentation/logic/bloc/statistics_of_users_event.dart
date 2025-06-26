part of 'statistics_of_users_bloc.dart';

sealed class StatisticsOfUsersEvent extends Equatable {
  const StatisticsOfUsersEvent();

  @override
  List<Object> get props => [];
}

class GetStatisticsOfusersEvent extends StatisticsOfUsersEvent {}
