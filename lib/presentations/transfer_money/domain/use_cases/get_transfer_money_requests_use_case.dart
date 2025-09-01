import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_list_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_request_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetTransferMoneyRequestsUseCase {
  TransferMoneyRepository transferMoneyRepository;
  GetTransferMoneyRequestsUseCase({required this.transferMoneyRepository});

  Future<Either<AdminExceptions, TransferMoneyListEntity>> call(
    TransferMoneyRequestEntity request,
  ) async {
    return await transferMoneyRepository.getTransferRequests(request);
  }
}
