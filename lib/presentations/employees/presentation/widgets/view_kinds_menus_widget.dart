import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_employees/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/models/drop_down_model.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/kinds_menu_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewKindsMenusWidget extends StatelessWidget {
  List<DropDownModel> activeList;
  List<DropDownModel> teamKindList;
  Size size;
  ViewKindsMenusWidget({
    required this.activeList,
    required this.teamKindList,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        KindsMenuWidget(
          size: size,
          kinds: activeList,
          currntValue:
              context.watch<KindsCubit>().employeesMiddleware.getTeamState(),
          onPressed: (value) {
            context.read<EmployeesBloc>().employeesMiddleware.changeTeamstate(
              value,
              context.read<KindsCubit>(),
            );
            context.read<EmployeesBloc>().add(GetEmployeesEvent());
          },
        ),

        KindsMenuWidget(
          size: size,
          kinds: teamKindList,
          currntValue:
              context.watch<KindsCubit>().employeesMiddleware.getTeamKind(),
          onPressed: (value) {
            context.read<EmployeesBloc>().employeesMiddleware.changeTeamKind(
              value,
              context.read<KindsCubit>(),
            );

            context.read<EmployeesBloc>().add(GetEmployeesEvent());
          },
        ),
      ],
    );
  }
}
