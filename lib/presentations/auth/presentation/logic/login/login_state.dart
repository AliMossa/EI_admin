part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoadingSendLoginState extends LoginState {}

// ignore: must_be_immutable
class SuccessSendLoginState extends LoginState {
  String message;
  SuccessSendLoginState({required this.message});
}

// ignore: must_be_immutable
class FailedSendLoginState extends LoginState {
  String message;
  FailedSendLoginState({required this.message});
}

class LoadingCheckLoggingState extends LoginState {}

class SuccessCheckLoggingState extends LoginState {}

class FailedCheckLoggingState extends LoginState {}
