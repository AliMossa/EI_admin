import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class WalletEntity extends Equatable {
  int id;
  int useId;
  int isActive;
  String balance;
  String currency;
  String walletType;
  WalletEntity({
    required this.id,
    required this.useId,
    required this.balance,
    required this.currency,
    required this.walletType,
    required this.isActive,
  });
  factory WalletEntity.init() => WalletEntity(
    id: -1,
    useId: -1,
    balance: '',
    currency: '',
    walletType: '',
    isActive: -1,
  );

  @override
  List<Object?> get props => [
    id,
    useId,
    balance,
    currency,
    walletType,
    isActive,
  ];
}
