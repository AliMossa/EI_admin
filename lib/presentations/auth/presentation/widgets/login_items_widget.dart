import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/email_text_field_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/forget_password_link_text_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/login_button_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/login_title_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/password_text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginItemsWidget extends StatelessWidget {
  Size size;
  LoginItemsWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginPagesCubit, LoginPagesState>(
      builder: (context, state) {
        return AnimatedOpacity(
          duration: Duration(milliseconds: 400),
          opacity: state is MoveToLoginPageState ? 1 : 0,

          child:
              state is MoveToLoginPageState
                  ? Column(
                    children: [
                      LoginTitleWidget(),
                      EmailTextFieldWidget(size: size),
                      PasswordTextFieldWidget(size: size),
                      ForgetPasswordLinkTextWidget(),
                      LoginButtonWidget(size: size),
                    ],
                  )
                  : SizedBox(),
        );
      },
    );
  }
}
