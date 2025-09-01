import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/employee_info_textfield_widget.dart';
import 'package:admin_dashboard/util/validations/validations.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddEmployeeConnectionInfoWidget extends StatelessWidget {
  Size size;
  AddEmployeeConnectionInfoWidget({required this.size, super.key});

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
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          EmployeeInfoTextfieldWidget(
            validate: (value) => Validations.getEmailVaidation(value),

            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setEmail(value),

            title: 'emial',
            size: size,
            focusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getEmailFocusNode(),
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getPhoneFocusNode(),
            widthSizeFactor: .3,
          ),
          EmployeeInfoTextfieldWidget(
            validate: (value) => Validations.getNumberValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setPhoneNumber(value),

            title: 'phone',
            size: size,
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getLinkedInFocusNode(),
            focusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getPhoneFocusNode(),
            widthSizeFactor: .3,
          ),
          EmployeeInfoTextfieldWidget(
            validate: (value) => Validations.getNameValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setAddress(value),

            title: 'address',
            size: size,
            nextFocusNode: FocusNode(),

            focusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getLinkedInFocusNode(),
            widthSizeFactor: .3,
          ),
        ],
      ),
    );
  }
}
