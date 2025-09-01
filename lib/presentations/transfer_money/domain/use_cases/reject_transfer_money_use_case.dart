import 'package:admin_dashboard/presentations/transfer_money/domain/entities/reject_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class RejectTransferMoneyUseCase {
  TransferMoneyRepository transferMoenyRepository;

  RejectTransferMoneyUseCase({required this.transferMoenyRepository});

  Future<Either<AdminExceptions, String>> call(
    RejectTransferMoneyEntity reject,
  ) async {
    return await transferMoenyRepository.rejectTransferRequests(reject);
  }
}
