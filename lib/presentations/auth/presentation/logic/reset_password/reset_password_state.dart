part of 'reset_password_bloc.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

class LoadingResetForgottenPasswordState extends ResetPasswordState {}

class SuccessResetForgottenPasswordState extends ResetPasswordState {}

// ignore: must_be_immutable
class FailedResetForgottenPasswordState extends ResetPasswordState {
  String message;
  FailedResetForgottenPasswordState({required this.message});
}
