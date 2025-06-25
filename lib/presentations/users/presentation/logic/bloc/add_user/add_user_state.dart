part of 'add_user_bloc.dart';

sealed class AddUserState extends Equatable {
  const AddUserState();

  @override
  List<Object> get props => [];
}

final class AddUserInitial extends AddUserState {}

class LoadingAddUserState extends AddUserState {}

class SuccessAddUserState extends AddUserState {}

// ignore: must_be_immutable
class FailedAddUserState extends AddUserState {
  String message;
  FailedAddUserState({required this.message});
}
