import 'package:admin_dashboard/presentations/public/add_new_member/add_new_member.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_connection_info_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_personal_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddUserWidgetItems extends StatelessWidget {
  Size size;
  AddUserWidgetItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddUserBloc, AddUserState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                AddUserPersonalInfoWidget(size: size),
                const SizedBox(width: 10),
                AddUserConnectionInfoWidget(size: size),
              ],
            ),
            state is LoadingAddUserState
                ? LoadingWidget()
                : AddNewMember(
                  onPress:
                      () => context.read<AddUserBloc>().add(SendAddUserEvent()),
                  size: size,
                  title: 'add',
                ),
          ],
        );
      },
      listener: (BuildContext context, AddUserState state) {
        if (state is SuccessAddUserState) {
          context.read<ChangePageBloc>().add(
            MoveToUsersPageEvent(title: 'Users'),
          );
        } else if (state is FailedAddUserState) {
          SnackBarWidget().show(context, state.message, Colors.red);
        }
      },
    );
  }
}
