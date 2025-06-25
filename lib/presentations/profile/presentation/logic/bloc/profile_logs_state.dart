part of 'profile_logs_bloc.dart';

sealed class ProfileLogsState extends Equatable {
  const ProfileLogsState();

  @override
  List<Object> get props => [];
}

final class ProfileLogsInitial extends ProfileLogsState {}

class LoadingGetProfileLogsState extends ProfileLogsState {}

class SuccessGetProfileLogsState extends ProfileLogsState {}

// ignore: must_be_immutable
class FailedGetProfileLogsState extends ProfileLogsState {
  String message;
  FailedGetProfileLogsState({required this.message});
}

class LoadingReGetProfileLogsState extends ProfileLogsState {}

class SuccessReGetProfileLogsState extends ProfileLogsState {}

// ignore: must_be_immutable
class FailedReGetProfileLogsState extends ProfileLogsState {
  String message;
  FailedReGetProfileLogsState({required this.message});
}
