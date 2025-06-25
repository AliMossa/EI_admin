import 'package:admin_dashboard/presentations/auth/presentation/logic/reset_password/reset_password_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/confirm_reset_password_text_filed.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/reset_password_text_field_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/reset_password_title_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/auth_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ResetPasswordListItemsWidget extends StatelessWidget {
  const ResetPasswordListItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20),
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Form(
                key:
                    context
                        .read<ResetPasswordBloc>()
                        .authMiddleware
                        .getResetpasswordGlobalKey(),
                child: ListView(
                  children: [
                    const SizedBox(height: 50),
                    ResetPasswordTitleWidget(),
                    const SizedBox(height: 20),
                    ResetPasswordTextFieldWidget(size: moreInfo),
                    ConfirmResetPasswordTextFiled(size: moreInfo),
                    const SizedBox(height: 50),
                    state is LoadingResetForgottenPasswordState
                        ? LoadingWidget()
                        : AuthButtonWidget(
                          title: 'reset',
                          onPressed:
                              () => context
                                  .read<ResetPasswordBloc>()
                                  .authMiddleware
                                  .resetPasswordButtonFunction(
                                    context,
                                    context.read<ResetPasswordBloc>(),
                                  ),
                        ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
