import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/add_deposit/add_deposit_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDepositItem extends StatelessWidget {
  const AddDepositItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => AnimatedOpacity(
            opacity: state is MoveToAddDepositPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToAddDepositPageState
                    ? AddDepositListItem(size: moreInfo)
                    : SizedBox(),
          ),
    );
    ;
  }
}
