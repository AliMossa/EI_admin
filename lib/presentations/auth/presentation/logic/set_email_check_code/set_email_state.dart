part of 'set_email_bloc.dart';

sealed class SetEmailState extends Equatable {
  const SetEmailState();

  @override
  List<Object> get props => [];
}

final class SetEmailInitial extends SetEmailState {}

class LoadingSendVerificationCodeState extends SetEmailState {}

class SuccessSendVerificationCodeState extends SetEmailState {}

class FailedSendVerificationCodeState extends SetEmailState {
  String message;
  FailedSendVerificationCodeState({required this.message});
}
