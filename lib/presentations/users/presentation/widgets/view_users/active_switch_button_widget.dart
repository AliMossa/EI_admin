import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/view_user/view_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/cubit/active_user_cubit.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ActiveSwitchButtonWidget extends StatelessWidget {
  int id;
  ActiveSwitchButtonWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveUserCubit, ActiveUserState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              context.watch<ActiveUserCubit>().userMiddleware.getIsActive()
                  ? Text('Acitve', style: activeSwitchIconStyle)
                  : Text('Non Acitve', style: inActiveSwitchIconStyle),
              Switch.adaptive(
                value:
                    context
                        .watch<ActiveUserCubit>()
                        .userMiddleware
                        .getIsActive(),
                onChanged:
                    (value) => context
                        .read<ActiveUserCubit>()
                        .userMiddleware
                        .activeDeActiveEmployee(
                          context,
                          value,
                          context.read<ViewUserBloc>(),
                          context.read<ActiveUserCubit>(),
                          id,
                        ),
                activeColor: Colors.green,
                inactiveThumbColor: Colors.red,
              ),
            ],
          ),
        );
      },
    );
  }
}
