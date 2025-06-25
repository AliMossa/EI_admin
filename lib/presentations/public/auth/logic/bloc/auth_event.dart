part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class MoveToLoginPageEvent extends AuthEvent {}

class MoveToResetPasswordPageEvent extends AuthEvent {}

class MoveToCheckCodePageEvent extends AuthEvent {}

class MoveToSetEmailCheckCodePageEvent extends AuthEvent {}
