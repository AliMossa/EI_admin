part of 'logout_bloc.dart';

sealed class LogoutState extends Equatable {
  const LogoutState();

  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

class LaodingSendLogoutState extends LogoutState {}

// ignore: must_be_immutable
class FailedSendLogoutState extends LogoutState {
  String message;
  FailedSendLogoutState({required this.message});
}

class SuccessSendLogoutState extends LogoutState {}
