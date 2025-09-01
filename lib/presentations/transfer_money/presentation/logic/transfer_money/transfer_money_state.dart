part of 'transfer_money_bloc.dart';

sealed class TransferMoneyState extends Equatable {
  const TransferMoneyState();

  @override
  List<Object> get props => [];
}

final class TransferMoneyInitial extends TransferMoneyState {}

class LoadingGetTransferMoneyRequestsState extends TransferMoneyState {}

class SuccessGetTransferMoneyRequestsState extends TransferMoneyState {}

// ignore: must_be_immutable
class FailedGetTransferMoneyRequestsState extends TransferMoneyState {
  String message;
  FailedGetTransferMoneyRequestsState({required this.message});
}
