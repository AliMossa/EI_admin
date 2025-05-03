import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/confirm_password_button_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/confirm_reset_password_text_filed.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password_text_field_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ResetPasswordItems extends StatelessWidget {
  Size size;
  ResetPasswordItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: BlocBuilder<LoginPagesCubit, LoginPagesState>(
        builder: (context, state) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 400),
            opacity: state is MoveToResetPasswordPageState ? 1 : 0,
            child:
                context.read<LoginPagesCubit>().state
                        is MoveToResetPasswordPageState
                    ? Column(
                      children: [
                        const SizedBox(height: 50),
                        ResetPasswordTitleWidget(),
                        const SizedBox(height: 20),
                        ResetPasswordTextFieldWidget(size: size),
                        ConfirmResetPasswordTextFiled(size: size),
                        const SizedBox(height: 50),
                        ConfirmPasswordButtonWidget(size: size),
                      ],
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
