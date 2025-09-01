import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_member_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_drop_down_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/drop_down_desicion_model.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_type/transfer_type_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_money/transfer_money_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/animated_transfer_money_list.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMomeyListItemsWidget extends StatelessWidget {
  const TransferMomeyListItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DesicionDropDownWidget(
                  size: moreInfo,
                  currntValue:
                      context
                          .read<TransferTypeBloc>()
                          .transferMoneyMiddleware
                          .get(),
                  kinds: DropDownDesicionModel().getTransferRequestsList(),
                  onPressed:
                      (value) => context
                          .read<TransferTypeBloc>()
                          .transferMoneyMiddleware
                          .changeTransferType(
                            context.read<TransferMoneyBloc>(),
                            context.read<TransferTypeBloc>(),
                            value,
                          ),
                ),
                const SizedBox(width: 30),
              ],
            ),
            AnimatedTransferMoneyList(
              size: moreInfo,
              transferMoneyListEntity:
                  context
                      .watch<TransferMoneyBloc>()
                      .transferMoneyMiddleware
                      .getTransferMoneyListEntity(),
              globalKey:
                  context
                      .watch<TransferMoneyBloc>()
                      .transferMoneyMiddleware
                      .getGlobalKey(),
            ),
          ],
        ),
        AddMemberButtonWidget(
          onPress:
              () => context.read<ChangePageBloc>().add(
                MoveToAddDepositPageEvent(title: 'Add Deposit'),
              ),
        ),
      ],
    );
  }
}
