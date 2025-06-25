import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/users_members_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersItems extends StatelessWidget {
  const UsersItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UsersBloc, UsersState>(
      listener:
          (context, state) => context
              .read<UsersBloc>()
              .userMiddleware
              .showFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToUsersPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToUsersPageState
                    ? UsersMembersWidget()
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
