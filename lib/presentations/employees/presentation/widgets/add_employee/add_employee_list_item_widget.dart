import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_connection_info_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_id_image_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_personal_info_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/flexible_add_employee_personal_info_widget.dart';
import 'package:admin_dashboard/presentations/public/add_new_member/add_new_member.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddEmployeeListItemWidget extends StatelessWidget {
  Size size;
  AddEmployeeListItemWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddEmployeeBloc, AddEmployeeState>(
      builder: (context, state) {
        return Form(
          key:
              context
                  .read<AddEmployeeBloc>()
                  .employeesMiddleware
                  .getAddEmployeeGlobalKey(),
          child: SizedBox(
            width: size.width * .8,
            height: size.height,
            child: ListView(
              dragStartBehavior: DragStartBehavior.start,
              shrinkWrap: true,
              children: [
                !FlexibleMethod.getAddEmployeePageFlexible(size)
                    ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        AddEmployeePersonalInfoWidget(size: size),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AddEmployeeConnectionInfoWidget(size: size),
                            const SizedBox(height: 10),
                            AddEmployeeIdImageWidget(size: size),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        FlexibleAddEmployeePersonalInfoWidget(size: size),
                        const SizedBox(width: 10),
                        AddEmployeeConnectionInfoWidget(size: size),
                        const SizedBox(height: 10),
                        AddEmployeeIdImageWidget(size: size),
                        const SizedBox(height: 10),
                      ],
                    ),
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getAddEmployeewidget(state, size)
                    .fold(
                      (_) => AddNewMember(
                        onPress:
                            () => context
                                .read<AddEmployeeBloc>()
                                .employeesMiddleware
                                .addEmployeeFunction(
                                  context,
                                  context.read<AddEmployeeBloc>(),
                                ),

                        size: size,
                        title: 'add',
                      ),
                      (widget) => widget,
                    ),
              ],
            ),
          ),
        );
      },
    );
  }
}
