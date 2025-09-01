import 'package:admin_dashboard/presentations/auth/presentation/logic/login/login_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/email_text_field_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/link_text_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/auth_button_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/login_title_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/password_text_field_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class LoginItemsWidget extends StatelessWidget {
  Size size;
  LoginItemsWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Form(
          key: context.read<LoginBloc>().authMiddleware.getLoginGlobalKey(),

          child: ListView(
            children: [
              LoginTitleWidget(size: size),
              EmailTextFieldWidget(size: size),
              PasswordTextFieldWidget(size: size),
              LinkTextWidget(
                title: 'forget',
                coloredTitle: 'password ?',
                size: size,
                onPressed:
                    () => context.read<AuthBloc>().add(
                      MoveToSetEmailCheckCodePageEvent(),
                    ),
              ),
              state is LoadingSendLoginState
                  ? LoadingWidget()
                  : AuthButtonWidget(
                    title: 'login',
                    onPressed:
                        () => context
                            .read<LoginBloc>()
                            .authMiddleware
                            .loginButtonFunction(
                              context,
                              context.read<LoginBloc>(),
                            ),
                  ),
            ],
          ),
        );
      },
    );
  }
}
