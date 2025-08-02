import 'package:admin_dashboard/presentations/wallet/data/repositories_imp_sources/wallet_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/logic/bloc/wallet_bloc.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/middleware/wallet_middleware.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/widgets/wallet_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPage extends StatelessWidget {
  final WalletMiddleware _walletMiddleware = WalletMiddleware();
  WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => WalletBloc(
            walletMiddleware: _walletMiddleware,
            walletRepository: WalletRepositoryImpSource(),
          )..add(GetWalletMoneyEvent()),
      child: const WalletItem(),
    );
  }
}
