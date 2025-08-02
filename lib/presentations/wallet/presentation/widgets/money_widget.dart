import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MoneyWidget extends StatelessWidget {
  WalletEntity walletEntity;
  Size size;
  MoneyWidget({required this.walletEntity, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      children: [
        Text(walletEntity.balance, style: getProfileNameStyle(size)),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(walletEntity.currency, style: getProfileSubNameStyle(size)),
              Text(
                walletEntity.walletType,
                style: getProfileSubNameStyle(size),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
