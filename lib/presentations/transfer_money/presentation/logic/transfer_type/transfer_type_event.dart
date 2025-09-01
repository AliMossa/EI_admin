part of 'transfer_type_bloc.dart';

sealed class TransferTypeEvent extends Equatable {
  const TransferTypeEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class ChangeTransferTypeEvent extends TransferTypeEvent {
  int type;
  ChangeTransferTypeEvent({required this.type});
}
