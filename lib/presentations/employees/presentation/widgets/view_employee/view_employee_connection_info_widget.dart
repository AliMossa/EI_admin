import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_textfield_widget.dart';
import 'package:admin_dashboard/util/validations/validations.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewEmployeeConnectionInfoWidget extends StatelessWidget {
  Size size;
  String? email;
  String? phone;
  String? address;
  ViewEmployeeConnectionInfoWidget({
    required this.email,
    required this.phone,
    required this.address,
    required this.size,
    super.key,
  });

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
          ViewEmployeeTextfieldWidget(
            initialInfo: email,
            validate: (value) => Validations.getEmailVaidation(value),

            onChange:
                (value) => context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .setEmail(value),

            title: 'emial',
            size: size,
            focusNode:
                context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .getEmailFocusNode(),
            nextFocusNode:
                context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .getPhoneFocusNode(),
            widthSizeFactor: .3,
          ),
          ViewEmployeeTextfieldWidget(
            initialInfo: phone,
            validate: (value) => Validations.getNumberValidation(value),
            onChange:
                (value) => context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .setPhoneNumber(value),

            title: 'phone',
            size: size,
            nextFocusNode:
                context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .getLinkedInFocusNode(),
            focusNode:
                context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .getPhoneFocusNode(),
            widthSizeFactor: .3,
          ),
          ViewEmployeeTextfieldWidget(
            initialInfo: address,
            validate: (value) => Validations.getNameValidation(value),
            onChange:
                (value) => context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .setAddress(value),

            title: 'address',
            size: size,
            nextFocusNode: FocusNode(),

            focusNode:
                context
                    .read<ViewUpdateEmployeeBloc>()
                    .employeesMiddleware
                    .getLinkedInFocusNode(),
            widthSizeFactor: .3,
          ),
        ],
      ),
    );
  }
}
