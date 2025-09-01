import 'package:admin_dashboard/presentations/transfer_money/domain/entities/about_user_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/accept_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/add_deposit_entity.dart'
    show AddDepositEntity;
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/reject_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_list_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_request_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class TransferMoneyRepository {
  Future<Either<AdminExceptions, TransferMoneyListEntity>> getTransferRequests(
    TransferMoneyRequestEntity request,
  );

  Future<Either<AdminExceptions, String>> rejectTransferRequests(
    RejectTransferMoneyEntity reject,
  );
  Future<Either<AdminExceptions, String>> accepttTransferRequests(
    AcceptTransferMoneyEntity accept,
  );

  Future<Either<AdminExceptions, AboutUserEntity>> searchAboutUser(
    String email,
  );
  Future<Either<AdminExceptions, String>> addDeposit(
    AddDepositEntity addDepositEntity,
  );
}
