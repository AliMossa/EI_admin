import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/transfer_momey_list_items_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMoneyItem extends StatelessWidget {
  const TransferMoneyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => AnimatedOpacity(
            opacity: state is MoveToTransferRequestsPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToTransferRequestsPageState
                    ? TransferMomeyListItemsWidget()
                    : SizedBox(),
          ),
    );
  }
}
