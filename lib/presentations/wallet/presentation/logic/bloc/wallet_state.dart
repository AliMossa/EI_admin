part of 'wallet_bloc.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}

class LoadingGetWalletMoneyState extends WalletState {}

class SuccessGetWalletMoneyState extends WalletState {}

// ignore: must_be_immutable
class FailedGetWalletMoneyState extends WalletState {
  String message;
  FailedGetWalletMoneyState({required this.message});
}
