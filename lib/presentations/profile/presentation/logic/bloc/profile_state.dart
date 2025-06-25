part of 'profile_bloc.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

class LoadingGetProfileInfoState extends ProfileState {}

class SuccessGetProfileInfoState extends ProfileState {}

// ignore: must_be_immutable
class FailedGetProfileInfoState extends ProfileState {
  String message;
  FailedGetProfileInfoState({required this.message});
}

class LoadingUpdateProfileInfoState extends ProfileState {}

class SuccessUpdateProfileInfoState extends ProfileState {}

// ignore: must_be_immutable
class FailedUpdateProfileInfoState extends ProfileState {
  String message;
  FailedUpdateProfileInfoState({required this.message});
}
