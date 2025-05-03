import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_birth_date_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_image_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/employee_info_textfield_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeePersonalInfoWidget extends StatelessWidget {
  Size size;
  AddEmployeePersonalInfoWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: linkColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AddEmployeeImageWidget(size: size),
              Column(
                children: [
                  EmployeeInfoTextfieldWidget(
                    title: 'first name',
                    size: size,
                    focusNode: FocusNode(),
                    nextFocusNode:
                        context
                            .read<EmployeesBloc>()
                            .employeesMiddleware
                            .getfatherNameFocusNode(),
                  ),
                  EmployeeInfoTextfieldWidget(
                    title: 'father name',
                    size: size,
                    nextFocusNode:
                        context
                            .read<EmployeesBloc>()
                            .employeesMiddleware
                            .getlastNameFocusNode(),
                    focusNode:
                        context
                            .read<EmployeesBloc>()
                            .employeesMiddleware
                            .getfatherNameFocusNode(),
                  ),
                  EmployeeInfoTextfieldWidget(
                    title: 'last name',
                    size: size,
                    nextFocusNode:
                        context
                            .read<EmployeesBloc>()
                            .employeesMiddleware
                            .getmotherNameFocusNode(),

                    focusNode:
                        context
                            .read<EmployeesBloc>()
                            .employeesMiddleware
                            .getlastNameFocusNode(),
                  ),
                  EmployeeInfoTextfieldWidget(
                    title: 'mother name',
                    size: size,
                    nextFocusNode: FocusNode(),
                    focusNode:
                        context
                            .read<EmployeesBloc>()
                            .employeesMiddleware
                            .getmotherNameFocusNode(),
                  ),
                ],
              ),
            ],
          ),
          AddEmployeeBirthDateWidget(size: size),
        ],
      ),
    );
  }
}
