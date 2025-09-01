import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RejectTransferMoneyEntity extends Equatable {
  int id;
  String notes;
  String token;

  RejectTransferMoneyEntity({
    required this.id,
    required this.notes,
    required this.token,
  });

  @override
  List<Object?> get props => [id, notes, token];
}
