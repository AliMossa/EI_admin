part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

class MoveToLoginPageState extends AuthState {}

class MoveToResetPasswordPageState extends AuthState {}

class MoveToCheckCodePageState extends AuthState {}

class MoveToSetEmailCheckCodePageState extends AuthState {}
