import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/logic/bloc/wallet_bloc.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/widgets/wallet_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletItem extends StatelessWidget {
  const WalletItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocConsumer<WalletBloc, WalletState>(
      listener:
          (context, state) => context
              .read<WalletBloc>()
              .walletMiddleware
              .showWalletFailedMessage(context, state),
      builder: (context, state) {
        return BlocBuilder<ChangePageBloc, ChangePageState>(
          builder:
              (context, state) => AnimatedOpacity(
                opacity: state is MoveToWalletPageState ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child:
                    state is MoveToWalletPageState
                        ? WalletListItem(
                          size: moreInfo,
                          walletEntity:
                              context
                                  .watch<WalletBloc>()
                                  .walletMiddleware
                                  .getWalletEntitye(),
                        )
                        : const SizedBox(),
              ),
        );
      },
    );
  }
}
