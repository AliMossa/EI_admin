part of 'users_type_cubit.dart';

sealed class UsersTypeState extends Equatable {
  const UsersTypeState();

  @override
  List<Object> get props => [];
}

final class UsersTypeInitial extends UsersTypeState {}

class LoadingChangeUsersTypeState extends UsersTypeState {}

class ChangeUsersTypeState extends UsersTypeState {}
