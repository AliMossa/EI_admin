import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_button_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_items.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/employees_members_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmplyeesItem extends StatelessWidget {
  const EmplyeesItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder: (context, state) {
        return Stack(
          children: [
            AnimatedOpacity(
              opacity: state is MoveToEmployeesPageState ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child:
                  state is MoveToEmployeesPageState
                      ? EmployeesMembersWidget()
                      : SizedBox(),
            ),
            AnimatedOpacity(
              opacity: state is MoveToAddEmployeesPageState ? 1 : 0,
              duration: const Duration(milliseconds: 400),
              child:
                  state is MoveToAddEmployeesPageState
                      ? AddEmployeeItems(size: moreInfo)
                      : SizedBox(),
            ),
          ],
        );
      },
    );
  }
}
