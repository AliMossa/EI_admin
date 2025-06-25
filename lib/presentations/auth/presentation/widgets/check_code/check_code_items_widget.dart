import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/check_code_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code/check_code_list_item_widget.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CheckCodeItemsWidget extends StatelessWidget {
  const CheckCodeItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<CheckCodeBloc, CheckCodeState>(
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            opacity: state is MoveToCheckCodePageState ? 1 : 0,

            child:
                state is MoveToCheckCodePageState
                    ? CheckCodeListItemWidget(
                      size: moreInfo,
                      onPress:
                          () => context
                              .read<CheckCodeBloc>()
                              .authMiddleware
                              .checkCodeButtonFunction(
                                context,
                                context.read<CheckCodeBloc>(),
                              ),
                      globalKey:
                          context
                              .read<CheckCodeBloc>()
                              .authMiddleware
                              .getCheckCodeGlobalKey(),
                    )
                    : SizedBox(),
          );
        },
      ),

      listener:
          (BuildContext context, CheckCodeState state) => context
              .read<CheckCodeBloc>()
              .authMiddleware
              .showCurrentStateInCheckCode(context, state),
    );
  }
}
