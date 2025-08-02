import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/logic/bloc/wallet_bloc.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/widgets/money_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WalletListItem extends StatelessWidget {
  Size size;
  WalletEntity walletEntity;
  WalletListItem({required this.size, required this.walletEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletBloc, WalletState>(
      builder:
          (context, state) => context
              .read<WalletBloc>()
              .walletMiddleware
              .getCorrectWidgetState(state, size)
              .fold(
                (_) => Container(
                  height: size.height * .5,
                  clipBehavior: Clip.hardEdge,
                  constraints: BoxConstraints(minWidth: 100, maxWidth: 500),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: mainGradient3,
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        Assets.images.wallet.path,
                        fit: BoxFit.fill,
                        opacity: AlwaysStoppedAnimation(.5),
                      ),
                      MoneyWidget(size: size, walletEntity: walletEntity),
                    ],
                  ),
                ),
                (right) => right,
              ),
    );
  }
}
