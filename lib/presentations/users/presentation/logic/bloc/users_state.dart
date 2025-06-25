part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {}

class LoadingGetUserState extends UsersState {}

// ignore: must_be_immutable
class SuccessGetUserState extends UsersState {}

// ignore: must_be_immutable
class FailedGetUserState extends UsersState {
  String message;
  FailedGetUserState({required this.message});
}

class LoadingReGetUserState extends UsersState {}

// ignore: must_be_immutable
class SuccessReGetUserState extends UsersState {}

// ignore: must_be_immutable
class FailedReGetUserState extends UsersState {
  String message;
  FailedReGetUserState({required this.message});
}
