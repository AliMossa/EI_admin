import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_update_employee_total_items.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUpdateEmployeeItem extends StatelessWidget {
  const ViewUpdateEmployeeItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<ViewUpdateEmployeeBloc, ViewUpdateEmployeeState>(
      listener:
          (context, state) => context
              .read<ViewUpdateEmployeeBloc>()
              .employeesMiddleware
              .showViewEmployeesFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, pageState) => AnimatedOpacity(
              opacity: pageState is MoveToViewEmployeePageState ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child:
                  pageState is MoveToViewEmployeePageState
                      ? ViewUpdateEmployeeTotalItems(size: moreInfo)
                      : SizedBox(),
            ),
      ),
    );
  }
}
