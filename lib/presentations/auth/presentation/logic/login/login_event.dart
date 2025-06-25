part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class SendLoginEvent extends LoginEvent {}

class CheckLoggingEvent extends LoginEvent {}
