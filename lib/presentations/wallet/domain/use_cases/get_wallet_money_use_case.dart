import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity_request.dart';
import 'package:admin_dashboard/presentations/wallet/domain/repositories/wallet_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetWalletMoneyUseCase {
  WalletRepository walletRepository;
  GetWalletMoneyUseCase({required this.walletRepository});

  Future<Either<ServerAdminException, WalletEntity>> call(
    WalletEntityRequest walletEntityRequest,
  ) async {
    return await walletRepository.getWalletMoney(walletEntityRequest);
  }
}
