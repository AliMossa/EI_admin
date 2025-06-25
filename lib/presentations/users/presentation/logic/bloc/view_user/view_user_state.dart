part of 'view_user_bloc.dart';

sealed class ViewUserState extends Equatable {
  const ViewUserState();

  @override
  List<Object> get props => [];
}

final class ViewUserInitial extends ViewUserState {}

class LoadingGetUserInformationState extends ViewUserState {}

class SuccessGetUserInformationState extends ViewUserState {}

// ignore: must_be_immutable
class FailedGetUserInformationState extends ViewUserState {
  String message;
  FailedGetUserInformationState({required this.message});
}

class LoadingUnActivateUserState extends ViewUserState {}

class SuccessUnActivateUserState extends ViewUserState {}

// ignore: must_be_immutable
class FailedUnActivateUserState extends ViewUserState {
  String message;
  FailedUnActivateUserState({required this.message});
}

class LoadingActivateUserState extends ViewUserState {}

class SuccessActivateUserState extends ViewUserState {}

// ignore: must_be_immutable
class FailedActivateUserState extends ViewUserState {
  String message;
  FailedActivateUserState({required this.message});
}
