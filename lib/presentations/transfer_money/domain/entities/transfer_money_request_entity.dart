import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransferMoneyRequestEntity extends Equatable {
  String type;
  String token;
  TransferMoneyRequestEntity({required this.type, required this.token});

  @override
  List<Object?> get props => [type, token];
}
