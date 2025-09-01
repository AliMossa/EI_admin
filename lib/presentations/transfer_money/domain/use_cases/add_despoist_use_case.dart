import 'package:admin_dashboard/presentations/transfer_money/domain/entities/add_deposit_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AddDespoistUseCase {
  TransferMoneyRepository transferMoenyRepository;
  AddDespoistUseCase({required this.transferMoenyRepository});

  Future<Either<AdminExceptions, String>> call(
    AddDepositEntity addDepositEntity,
  ) async {
    return await transferMoenyRepository.addDeposit(addDepositEntity);
  }
}
