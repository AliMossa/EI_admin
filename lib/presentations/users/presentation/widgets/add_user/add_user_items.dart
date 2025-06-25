import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_widget_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddUserItems extends StatelessWidget {
  const AddUserItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<AddUserBloc, AddUserState>(
      listener:
          (context, state) => context
              .read<AddUserBloc>()
              .userMiddleware
              .showAddUserFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => AnimatedOpacity(
              opacity: state is MoveToAddUserPageState ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,

              child:
                  state is MoveToAddUserPageState
                      ? AddUserWidgetItems(size: moreInfo)
                      : SizedBox(),
            ),
      ),
    );
  }
}
