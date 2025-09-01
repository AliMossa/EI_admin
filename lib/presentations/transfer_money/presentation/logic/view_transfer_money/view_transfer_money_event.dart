part of 'view_transfer_money_bloc.dart';

sealed class ViewTransferMoneyEvent extends Equatable {
  const ViewTransferMoneyEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class SetViewTransferMoneyEvent extends ViewTransferMoneyEvent {
  TransferMoneyEntity transfermoneyEntity;
  SetViewTransferMoneyEvent({required this.transfermoneyEntity});
}

// ignore: must_be_immutable
class RejectTransferMoneyRequestEvent extends ViewTransferMoneyEvent {
  int transferMoneyRequestId;
  RejectTransferMoneyRequestEvent({required this.transferMoneyRequestId});
}

// ignore: must_be_immutable
class AcceptTransferMoneyRequestEvent extends ViewTransferMoneyEvent {
  int transferMoneyRequestId;
  AcceptTransferMoneyRequestEvent({required this.transferMoneyRequestId});
}
