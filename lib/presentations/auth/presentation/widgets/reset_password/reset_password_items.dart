import 'package:admin_dashboard/presentations/auth/presentation/logic/reset_password/reset_password_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/reset_password_list_items_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordItems extends StatelessWidget {
  const ResetPasswordItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordBloc, ResetPasswordState>(
      listener:
          (context, state) => context
              .read<ResetPasswordBloc>()
              .authMiddleware
              .showCurrentStateInResetPassword(context, state),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder:
            (context, state) => AnimatedOpacity(
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInBack,

              opacity: state is MoveToResetPasswordPageState ? 1 : 0,
              child:
                  state is MoveToResetPasswordPageState
                      ? ResetPasswordListItemsWidget()
                      : const SizedBox(),
            ),
      ),
    );
  }
}
