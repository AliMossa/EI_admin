import 'package:admin_dashboard/presentations/auth/presentation/logic/reset_password/reset_password_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/login/login_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ConfirmPasswordButtonWidget extends StatelessWidget {
  Size size;
  ConfirmPasswordButtonWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
      builder: (context, state) {
        return Container(
          margin: EdgeInsets.all(10),
          width: size.width * .14,
          height: 50,
          decoration: BoxDecoration(
            gradient: mainGradient,
            borderRadius: BorderRadius.circular(15),
          ),

          child: ElevatedButton(
            onPressed:
                state is LoadingResetForgottenPasswordState
                    ? null
                    : () => context
                        .read<ResetPasswordBloc>()
                        .authMiddleware
                        .resetPasswordButtonFunction(
                          context,
                          context.read<ResetPasswordBloc>(),
                        ),

            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
            ),
            child:
                state is LoadingResetForgottenPasswordState
                    ? Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                    : Text(
                      'reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
          ),
        );
      },
    );
  }
}
