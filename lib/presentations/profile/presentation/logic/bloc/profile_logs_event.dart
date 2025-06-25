part of 'profile_logs_bloc.dart';

sealed class ProfileLogsEvent extends Equatable {
  const ProfileLogsEvent();

  @override
  List<Object> get props => [];
}

class GetProfileLogsEvent extends ProfileLogsEvent {}

// ignore: must_be_immutable
class ReGetProfileLogsEvent extends ProfileLogsEvent {}
