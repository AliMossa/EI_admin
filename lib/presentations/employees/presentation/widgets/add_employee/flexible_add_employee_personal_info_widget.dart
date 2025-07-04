import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_date_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_cities_types_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/employee_info_textfield_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/password_widget/password_widget.dart';
import 'package:admin_dashboard/presentations/public/validations/validations.dart';
import 'package:admin_dashboard/presentations/public/view_personal_image/view_pesonal_image.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class FlexibleAddEmployeePersonalInfoWidget extends StatelessWidget {
  Size size;
  FlexibleAddEmployeePersonalInfoWidget({required this.size, super.key});

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
          ViewPesonalImage(
            size: size,
            memberImageMiddleware:
                context.read<AddEmployeeBloc>().employeesMiddleware,
          ),
          EmployeeInfoTextfieldWidget(
            validate: (value) => Validations.getNameValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setFullName(value),
            title: 'full name',
            size: size,
            focusNode: FocusNode(),
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getfatherNameFocusNode(),
            widthSizeFactor: .15,
          ),
          EmployeeInfoTextfieldWidget(
            validate: (value) => Validations.getNameValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setFatherName(value),

            title: 'father name',
            size: size,
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getmotherNameFocusNode(),
            focusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getfatherNameFocusNode(),
            widthSizeFactor: .15,
          ),

          EmployeeInfoTextfieldWidget(
            validate: (value) => Validations.getNameValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setMotherName(value),

            title: 'mother name',
            size: size,
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getPasswordFocusNode(),
            focusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getmotherNameFocusNode(),
            widthSizeFactor: .15,
          ),
          PasswordWidget(
            validate: (value) => Validations.getPasswordValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setPassword(value),

            title: 'password',
            size: size,
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getConfirmPasswordFocusNode(),
            currentFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getPasswordFocusNode(),
            widthSizeFactor: .15,
          ),
          PasswordWidget(
            validate:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getConfirmPasswordValidation(value),
            onChange:
                (value) => context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .setConfirmPassword(value),

            title: 'confirm password',
            size: size,
            nextFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getEmailFocusNode(),
            currentFocusNode:
                context
                    .read<AddEmployeeBloc>()
                    .employeesMiddleware
                    .getConfirmPasswordFocusNode(),
            widthSizeFactor: .15,
          ),

          BlocBuilder<DateCubit, DateState>(
            builder: (context, state) {
              return AddDateWidget(
                title: 'birth date',
                birth:
                    context
                        .watch<AddEmployeeBloc>()
                        .employeesMiddleware
                        .getDateBirth(),
                size: size,
                onPress:
                    () => context
                        .read<AddEmployeeBloc>()
                        .employeesMiddleware
                        .setDate(context),
              );
            },
          ),
          AddEmployeeCitiesTypesWidget(size: size),
        ],
      ),
    );
  }
}
