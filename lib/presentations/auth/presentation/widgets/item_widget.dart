import 'package:admin_dashboard/presentations/auth/presentation/logic/login/login_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/login_items_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<LoginBloc, LoginState>(
      listener:
          (BuildContext context, LoginState state) => context
              .read<LoginBloc>()
              .authMiddleware
              .showCurrentStateInLogin(context, state),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToLoginPageState ? 1 : 0,

            duration: Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToLoginPageState
                    ? LoginItemsWidget(size: moreInfo)
                    : const SizedBox(),
          );
        },
      ),
    );
  }
}
