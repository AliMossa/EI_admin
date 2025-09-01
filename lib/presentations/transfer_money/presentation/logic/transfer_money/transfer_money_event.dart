part of 'transfer_money_bloc.dart';

sealed class TransferMoneyEvent extends Equatable {
  const TransferMoneyEvent();

  @override
  List<Object> get props => [];
}

class GetTransferMoneyRequestsEvent extends TransferMoneyEvent {}
