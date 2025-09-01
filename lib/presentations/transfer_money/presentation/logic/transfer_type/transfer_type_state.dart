part of 'transfer_type_bloc.dart';

sealed class TransferTypeState extends Equatable {
  const TransferTypeState();

  @override
  List<Object> get props => [];
}

final class TransferTypeInitial extends TransferTypeState {}

class LoadingChangeTransferTypeState extends TransferTypeState {}

class ChangeTransferTypeState extends TransferTypeState {}
