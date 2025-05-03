part of 'login_pages_cubit.dart';

sealed class LoginPagesState extends Equatable {
  const LoginPagesState();

  @override
  List<Object> get props => [];
}

final class LoginPagesInitial extends LoginPagesState {}

class MoveToCheckCodePageState extends LoginPagesState {}

class MoveToResetPasswordPageState extends LoginPagesState {}

class MoveToLoginPageState extends LoginPagesState {}

class LoadingMoveToCheckCodePageState extends LoginPagesState {}

class LoadingMoveToResetPasswordPageState extends LoginPagesState {}

class LoadingMoveToLoginPageState extends LoginPagesState {}
