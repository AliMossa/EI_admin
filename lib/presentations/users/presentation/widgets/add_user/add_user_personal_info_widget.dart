import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/add_user_password_text_field_widget.dart';
import 'package:admin_dashboard/presentations/users/presentation/widgets/add_user/user_info_text_field_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddUserPersonalInfoWidget extends StatelessWidget {
  Size size;
  AddUserPersonalInfoWidget({required this.size, super.key});

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
            title: 'full name',
            size: size,
            focusNode: FocusNode(),
            nextFocusNode:
                context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getPasswordFocusNode(),
            widthSizeFactor: .25,
            onChange:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .setFullName(value),
            validator:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getNameValidation(value),
          ),
          AddUserPasswordTextFieldWidget(
            validate:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getPasswordValidation(value),
            title: 'password',
            size: size,
            currentFocusNode:
                context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getPasswordFocusNode(),
            nextFocusNode:
                context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getConfirmFocusNode(),
            widthSizeFactor: .25,
            onChange:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .setPassword(value),
          ),
          AddUserPasswordTextFieldWidget(
            validate:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getConfirmPasswordValidation(value),
            title: 'confirm password',
            size: size,
            currentFocusNode:
                context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .getConfirmFocusNode(),
            nextFocusNode:
                context.read<AddUserBloc>().userMiddleware.getEmailFocusNode(),
            widthSizeFactor: .25,
            onChange:
                (value) => context
                    .read<AddUserBloc>()
                    .userMiddleware
                    .setConfirmPassword(value),
          ),
        ],
      ),
    );
  }
}
