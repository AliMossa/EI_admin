import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_employees/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/employees_members_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmplyeesItem extends StatelessWidget {
  const EmplyeesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmployeesBloc, EmployeesState>(
      listener:
          (context, state) => context
              .read<EmployeesBloc>()
              .employeesMiddleware
              .showGetEmployeesFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToEmployeesPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToEmployeesPageState
                    ? EmployeesMembersWidget(
                      list:
                          context
                              .watch<EmployeesBloc>()
                              .employeesMiddleware
                              .getTotalEmployeesEntity()
                              .employees,
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
