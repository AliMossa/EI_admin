import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/active/active_cubit.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ActievRadioButtonWidget extends StatelessWidget {
  int id;
  ActievRadioButtonWidget({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActiveCubit, ActiveState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            context
                    .watch<ActiveCubit>()
                    .employeesMiddleware
                    .getCorrectSwitchTextStyle()
                ? Text('Acitve', style: activeSwitchIconStyle)
                : Text('Non Acitve', style: inActiveSwitchIconStyle),
            Switch.adaptive(
              value:
                  context
                      .watch<ActiveCubit>()
                      .employeesMiddleware
                      .getIsActive(),
              onChanged:
                  (value) => context
                      .read<ActiveCubit>()
                      .employeesMiddleware
                      .activeDeActiveEmployee(
                        context,
                        value,
                        context.read<ViewUpdateEmployeeBloc>(),
                        context.read<ActiveCubit>(),
                        id,
                      ),
              activeColor: Colors.green,
              inactiveThumbColor: Colors.red,
            ),
          ],
        );
      },
    );
  }
}
