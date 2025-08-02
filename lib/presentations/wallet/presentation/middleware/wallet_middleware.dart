import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/wallet_shimmer.dart';
import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/logic/bloc/wallet_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class WalletMiddleware {
  double _walletMoney = 0;
  WalletEntity _walletEntity = WalletEntity.init();
  void setWalletMoney(double money) => _walletMoney = money;
  String getWalletMoney() => NumberFormat.decimalPattern().format(_walletMoney);

  void showWalletFailedMessage(BuildContext context, WalletState state) {
    if (state is FailedGetWalletMoneyState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void setWallet(WalletEntity wallet) {
    _walletEntity.id = wallet.id;
    _walletEntity.useId = wallet.useId;
    _walletEntity.balance = wallet.balance;
    _walletEntity.currency = wallet.currency;
    _walletEntity.walletType = wallet.walletType;
    _walletEntity.isActive = wallet.isActive;
  }

  WalletEntity getWalletEntitye() => _walletEntity;

  Either<Widget, Widget> getCorrectWidgetState(WalletState state, Size size) {
    if (state is LoadingGetWalletMoneyState) {
      return right(WalletShimmer(size: size, height: .5, width: .5));
    } else if (state is FailedGetWalletMoneyState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else {
      return left(const SizedBox());
    }
  }
}
