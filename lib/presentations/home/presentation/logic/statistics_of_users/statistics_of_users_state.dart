part of 'statistics_of_users_bloc.dart';

sealed class StatisticsOfUsersState extends Equatable {
  const StatisticsOfUsersState();

  @override
  List<Object> get props => [];
}

final class StatisticsOfUsersInitial extends StatisticsOfUsersState {}

class LoadingGetStatisticsOfusersState extends StatisticsOfUsersState {}

class SuccessGetStatisticsOfusersState extends StatisticsOfUsersState {}

// ignore: must_be_immutable
class FailedGetStatisticsOfusersState extends StatisticsOfUsersState {
  String message;
  FailedGetStatisticsOfusersState({required this.message});
}
