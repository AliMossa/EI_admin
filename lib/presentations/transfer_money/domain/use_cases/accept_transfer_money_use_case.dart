import 'package:admin_dashboard/presentations/transfer_money/domain/entities/accept_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AcceptTransferMoneyUseCase {
  TransferMoneyRepository transferMoenyRepository;

  AcceptTransferMoneyUseCase({required this.transferMoenyRepository});

  Future<Either<AdminExceptions, String>> call(
    AcceptTransferMoneyEntity accept,
  ) async {
    return await transferMoenyRepository.accepttTransferRequests(accept);
  }
}
