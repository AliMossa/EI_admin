import 'package:admin_dashboard/presentations/transfer_money/data/data_sources/accept_transfer_money_requests_data_source.dart';
import 'package:admin_dashboard/presentations/transfer_money/data/data_sources/add_deposit_data_source.dart';
import 'package:admin_dashboard/presentations/transfer_money/data/data_sources/get_transfer_money_requests_data_source.dart';
import 'package:admin_dashboard/presentations/transfer_money/data/data_sources/reject_transfer_money_request_data_source.dart';
import 'package:admin_dashboard/presentations/transfer_money/data/data_sources/search_about_user_data_source.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/about_user_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/accept_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/add_deposit_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/reject_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_list_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_request_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class TransferMoenyRepositoryImp implements TransferMoneyRepository {
  @override
  Future<Either<AdminExceptions, TransferMoneyListEntity>> getTransferRequests(
    TransferMoneyRequestEntity transfertMoneyRequest,
  ) async {
    try {
      return right(
        await GetTransferMoneyRequestsDataSourceWithDio()
            .getTransferMoneyRequests(transfertMoneyRequest),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> accepttTransferRequests(
    AcceptTransferMoneyEntity accept,
  ) async {
    try {
      return right(
        await AcceptTransferMoneyRequestsDataSourceWithDio()
            .acceptTransferMoneyRequest(accept),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> rejectTransferRequests(
    RejectTransferMoneyEntity reject,
  ) async {
    try {
      return right(
        await RejectTransferMoneyRequestDataSourceWithDio()
            .rejectTransferMoneyRequest(reject),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, AboutUserEntity>> searchAboutUser(
    String email,
  ) async {
    try {
      return right(
        await SearchAboutUserDataSourceWithDio().searchAboutuser(email),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> addDeposit(
    AddDepositEntity addDepositEntity,
  ) async {
    try {
      return right(
        await AddDepositDataSourceWithDio().addDeposit(addDepositEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
