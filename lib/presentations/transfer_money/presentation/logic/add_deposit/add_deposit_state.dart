part of 'add_deposit_bloc.dart';

sealed class AddDepositState extends Equatable {
  const AddDepositState();

  @override
  List<Object> get props => [];
}

final class AddDepositInitial extends AddDepositState {}

class LoadingSearchAboutUserState extends AddDepositState {}

class SuccessSearchAboutUserState extends AddDepositState {}

// ignore: must_be_immutable
class FailedSearchAboutUserState extends AddDepositState {
  String message;
  FailedSearchAboutUserState({required this.message});
}

class LoadingSendAddDepositState extends AddDepositState {}

class SuccessSendAddDepositState extends AddDepositState {}

// ignore: must_be_immutable
class FailedSendAddDepositState extends AddDepositState {
  String message;
  FailedSendAddDepositState({required this.message});
}
