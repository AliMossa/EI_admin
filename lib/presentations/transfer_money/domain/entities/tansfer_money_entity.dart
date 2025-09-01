import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransferMoneyEntity extends Equatable {
  int id;
  int userId;
  String amount;
  String method;
  String fullName;
  String phone;
  String createdAt;
  String? walletAddress;
  String? cardNumber;
  String? accountHolderName;

  TransferMoneyEntity({
    required this.id,
    required this.userId,
    required this.amount,
    required this.method,
    required this.fullName,
    required this.phone,
    required this.createdAt,
    this.walletAddress,
    this.cardNumber,
    this.accountHolderName,
  });
  factory TransferMoneyEntity.init() => TransferMoneyEntity(
    id: -1,
    userId: -1,
    amount: '',
    createdAt: '',
    fullName: '',
    method: '',
    phone: '',
  );
  @override
  List<Object?> get props => [
    id,
    userId,
    amount,
    method,
    fullName,
    phone,
    createdAt,
  ];
}
