import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/view_transfer_money/view_transfer_money_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/view_transfer_request/view_transfer_request_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewTransferRequestItem extends StatelessWidget {
  const ViewTransferRequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => AnimatedOpacity(
            opacity: state is MoveToViewTransferRequestsPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToViewTransferRequestsPageState
                    ? ViewTransferRequestListItem(
                      size: moreInfo,
                      tansferMoneyEntity:
                          context
                              .watch<ViewTransferMoneyBloc>()
                              .transferMoneyMiddleware
                              .getTransferMoneyEntity(),
                    )
                    : SizedBox(),
          ),
    );
    ;
  }
}
