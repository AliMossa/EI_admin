part of 'view_transfer_money_bloc.dart';

sealed class ViewTransferMoneyState extends Equatable {
  const ViewTransferMoneyState();

  @override
  List<Object> get props => [];
}

final class ViewTransferMoneyInitial extends ViewTransferMoneyState {}

class SetViewTransferMoneyState extends ViewTransferMoneyState {}

class LoadingRejectTransferMoneyRequestEvent extends ViewTransferMoneyState {}

class SuccessRejectTransferMoneyRequestEvent extends ViewTransferMoneyState {}

// ignore: must_be_immutable
class FailedRejectTransferMoneyRequestEvent extends ViewTransferMoneyState {
  String message;
  FailedRejectTransferMoneyRequestEvent({required this.message});
}

class LoadingAcceptTransferMoneyRequestEvent extends ViewTransferMoneyState {}

class SuccessAcceptTransferMoneyRequestEvent extends ViewTransferMoneyState {}

// ignore: must_be_immutable
class FailedAcceptTransferMoneyRequestEvent extends ViewTransferMoneyState {
  String message;
  FailedAcceptTransferMoneyRequestEvent({required this.message});
}
