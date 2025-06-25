import 'package:admin_dashboard/presentations/auth/presentation/logic/set_email_check_code/set_email_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/set_email_check_code.dart/set_email_check_code_list_item_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SetEmailCheckCodeItems extends StatelessWidget {
  const SetEmailCheckCodeItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<SetEmailBloc, SetEmailState>(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state2) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            opacity: state2 is MoveToSetEmailCheckCodePageState ? 1 : 0,

            child:
                state2 is MoveToSetEmailCheckCodePageState
                    ? SetEmailCheckCodeListItemWidget(
                      size: moreInfo,
                      onPressed:
                          () => context
                              .read<SetEmailBloc>()
                              .authMiddleware
                              .sendVerificationCodeButtonFunction(
                                context,
                                context.read<SetEmailBloc>(),
                              ),
                    )
                    : SizedBox(),
          );
        },
      ),

      listener:
          (BuildContext context, SetEmailState state) => context
              .read<SetEmailBloc>()
              .authMiddleware
              .showCurrentStateInSetEmailCheckCode(context, state),
    );
  }
}
