import 'package:admin_dashboard/presentations/wallet/data/data_sources/get_wallet_money_data_source.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity_request.dart';
import 'package:admin_dashboard/presentations/wallet/domain/repositories/wallet_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class WalletRepositoryImpSource implements WalletRepository {
  @override
  Future<Either<ServerAdminException, WalletEntity>> getWalletMoney(
    WalletEntityRequest walletEntityRequest,
  ) async {
    try {
      return right(
        await GetWalletMoneyDataSourceWithDio().getWalletMoney(
          walletEntityRequest,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
