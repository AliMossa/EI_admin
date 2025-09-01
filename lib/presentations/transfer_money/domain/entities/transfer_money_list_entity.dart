import 'package:admin_dashboard/presentations/transfer_money/domain/entities/tansfer_money_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TransferMoneyListEntity extends Equatable {
  String nextPage;
  List<TransferMoneyEntity> requests;

  TransferMoneyListEntity({required this.requests, required this.nextPage});

  factory TransferMoneyListEntity.init() =>
      TransferMoneyListEntity(nextPage: '', requests: []);
  @override
  List<Object?> get props => [nextPage, requests];
}
