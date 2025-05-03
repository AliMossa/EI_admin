part of 'password_cubit.dart';

sealed class PasswordState extends Equatable {
  const PasswordState();

  @override
  List<Object> get props => [];
}

final class PasswordInitial extends PasswordState {}

class ShowPasswordState extends PasswordState {}

class HidePasswordState extends PasswordState {}

class ShowConfirmPasswordState extends PasswordState {}

class HideConfirmPasswordState extends PasswordState {}
