import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_list_item_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddEmployeeItems extends StatelessWidget {
  const AddEmployeeItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<AddEmployeeBloc, AddEmployeeState>(
      listener:
          (BuildContext context, AddEmployeeState state) => context
              .read<AddEmployeeBloc>()
              .employeesMiddleware
              .showAddEmployeesFailedMessage(
                context,
                state,
                context.read<ChangePageBloc>(),
              ),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToAddEmployeesPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child:
                state is MoveToAddEmployeesPageState
                    ? AddEmployeeListItemWidget(size: moreInfo)
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
