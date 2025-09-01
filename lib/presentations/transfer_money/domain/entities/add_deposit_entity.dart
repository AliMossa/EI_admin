import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddDepositEntity extends Equatable {
  int userId;
  num amount;
  String token;
  AddDepositEntity({
    required this.userId,
    required this.token,
    required this.amount,
  });
  @override
  List<Object?> get props => [userId, token, amount];
}
