import 'package:admin_dashboard/presentations/public/public_widgets/password_widget/change_password_text_filed.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/password_widget/password_widget.dart';
import 'package:admin_dashboard/util/validations/validations.dart';
import 'package:admin_dashboard/presentations/settings/presentation/logic/bloc/password_bloc.dart';
import 'package:admin_dashboard/presentations/settings/presentation/widgets/change_password/change_password_button_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChangePasswordListItems extends StatelessWidget {
  Size size;
  ChangePasswordListItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<PasswordBloc>().settingsMiddleware.getKey(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: linkColor),
          color: background,
        ),
        width: FlexibleMethod.getChangePsswordWidth(size).width,
        child: ListView(
          shrinkWrap: true,
          children: [
            PasswordWidget(
              widthSizeFactor: .3,
              validate: (value) => Validations.getPasswordValidation(value),
              onChange:
                  (value) => context
                      .read<PasswordBloc>()
                      .settingsMiddleware
                      .setPassword(value),

              title: 'new password',
              size: size,
              nextFocusNode:
                  context
                      .read<PasswordBloc>()
                      .settingsMiddleware
                      .getConfirmPasswordFocusNode(),
              currentFocusNode: FocusNode(),
            ),
            PasswordWidget(
              widthSizeFactor: .3,
              validate:
                  (value) => context
                      .read<PasswordBloc>()
                      .settingsMiddleware
                      .getConfirmPasswordValidation(value),
              onChange:
                  (value) => context
                      .read<PasswordBloc>()
                      .settingsMiddleware
                      .setConfirmPassword(value),

              title: 'confirm new password',
              size: size,
              nextFocusNode: FocusNode(),
              currentFocusNode:
                  context
                      .read<PasswordBloc>()
                      .settingsMiddleware
                      .getConfirmPasswordFocusNode(),
            ),
            ChangePasswordButtonWidget(
              onPressed:
                  () => context
                      .read<PasswordBloc>()
                      .settingsMiddleware
                      .changePassword(context.read<PasswordBloc>()),
              title: 'Change',
              size: size,
            ),
          ],
        ),
      ),
    );
  }
}
