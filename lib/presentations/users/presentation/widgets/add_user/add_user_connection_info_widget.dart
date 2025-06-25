import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/user_info_text_field_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddUserConnectionInfoWidget extends StatelessWidget {
  Size size;
  AddUserConnectionInfoWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: linkColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,

        children: [
          UserInfoTextFieldWidget(
            title: 'emial',
            size: size,
            focusNode:
                context.read<AddUserBloc>().userMiddleware.getEmailFocusNode(),
            nextFocusNode:
                context.read<AddUserBloc>().userMiddleware.getPhoneFocusNode(),
            widthSizeFactor: .35,
            validator:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getEmailVaidation(value),
            onChange:
                (value) =>
                    context.read<AddUserBloc>().userMiddleware.setEmail(value),
          ),
          UserInfoTextFieldWidget(
            title: 'phone',
            size: size,
            focusNode:
                context.read<AddUserBloc>().userMiddleware.getPhoneFocusNode(),

            nextFocusNode: FocusNode(),
            widthSizeFactor: .35,
            validator:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getNumberValidation(value),
            onChange:
                (value) =>
                    context.read<AddUserBloc>().userMiddleware.setPhone(value),
          ),
        ],
      ),
    );
  }
}
