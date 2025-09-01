import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AcceptTransferMoneyEntity extends Equatable {
  int id;
  String transactionReference;
  String token;
  AcceptTransferMoneyEntity({
    required this.id,
    required this.transactionReference,
    required this.token,
  });

  @override
  List<Object?> get props => [id, transactionReference, token];
}
