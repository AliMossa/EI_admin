import 'package:admin_dashboard/presentations/public/add_new_member/add_new_member.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_connection_info_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_personal_info_widget.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            !FlexibleMethod.getAddUserItemFlexible(size)
                ? Row(
                  children: [
                    AddUserPersonalInfoWidget(size: size),
                    const SizedBox(width: 10),
                    AddUserConnectionInfoWidget(size: size),
                  ],
                )
                : SizedBox(
                  width: size.width * .5 + 20,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      AddUserPersonalInfoWidget(size: size),
                      const SizedBox(height: 10),
                      AddUserConnectionInfoWidget(size: size),
                    ],
                  ),
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
      listener:
          (BuildContext context, AddUserState state) => context
              .read<AddUserBloc>()
              .userMiddleware
              .showAddUserFailedMessage(context, state),
    );
  }
}
