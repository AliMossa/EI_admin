part of 'password_bloc.dart';

sealed class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

final class PasswordInitial extends PasswordState {}

class LoadingChangePasswordState extends PasswordState {}

class SuccessChangePasswordState extends PasswordState {}

// ignore: must_be_immutable
class FailedChangePasswordState extends PasswordState {
  String message;
  FailedChangePasswordState({required this.message});
}
