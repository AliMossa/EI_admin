part of 'logout_bloc.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

class LaodingSendLogoutState extends LogoutState {}

class FailedSendLogoutState extends LogoutState {}

class SuccessSendLogoutState extends LogoutState {}
