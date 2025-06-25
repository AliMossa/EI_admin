part of 'user_password_cubit.dart';

sealed class UserPasswordState extends Equatable {
  const UserPasswordState();

  @override
  List<Object> get props => [];
}

final class UserPasswordInitial extends UserPasswordState {}

class ShowPasswordState extends UserPasswordState {}

class HidePasswordState extends UserPasswordState {}
