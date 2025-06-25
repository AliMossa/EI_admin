import 'package:admin_dashboard/presentations/auth/presentation/logic/set_email_check_code/set_email_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/auth_title_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/set_email_check_code.dart/set_email_check_code_text_field_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/auth_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/link_text_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SetEmailCheckCodeListItemWidget extends StatelessWidget {
  Size size;
  Function() onPressed;
  SetEmailCheckCodeListItemWidget({
    required this.onPressed,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SetEmailBloc, SetEmailState>(
      builder: (context, state) {
        return Form(
          key:
              context
                  .read<SetEmailBloc>()
                  .authMiddleware
                  .getSendVerificationCodeGlobalKey(),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              AuthTitleWidget(statement: 'Confirm your email'),
              const SizedBox(height: 50),
              SetEmailCheckCodeTextFieldWidget(size: size),
              const SizedBox(height: 5),
              LinkTextWidget(
                size: size,
                title: 'back to',
                coloredTitle: 'login page',
                onPressed:
                    () => context.read<AuthBloc>().add(MoveToLoginPageEvent()),
              ),
              const SizedBox(height: 5),
              state is LoadingSendVerificationCodeState
                  ? LoadingWidget()
                  : AuthButtonWidget(title: 'Send', onPressed: onPressed),
            ],
          ),
        );
      },
    );
  }
}
