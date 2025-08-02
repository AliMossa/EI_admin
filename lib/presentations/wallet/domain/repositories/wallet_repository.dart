import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity_request.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class WalletRepository {
  Future<Either<ServerAdminException, WalletEntity>> getWalletMoney(
    WalletEntityRequest walletEntityRequest,
  );
}
