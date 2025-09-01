part of 'add_deposit_bloc.dart';

sealed class AddDepositEvent extends Equatable {
  const AddDepositEvent();

  @override
  List<Object> get props => [];
}

class SearchAboutUserEvent extends AddDepositEvent {}

// ignore: must_be_immutable
class SendAddDepositEvent extends AddDepositEvent {
  int userId;
  SendAddDepositEvent({required this.userId});
}
