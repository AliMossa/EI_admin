import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_cities_types_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/actiev_switch_button_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_birth_date_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_id_text_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_presonal_image_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_employee_textfield_widget.dart';
import 'package:admin_dashboard/presentations/public/validations/validations.dart';
import 'package:admin_dashboard/presentations/public/view_personal_image/logic/cubit/member_image_cubit.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewEmployeePersonalInfoWidget extends StatelessWidget {
  int id;
  int isActive;
  Size size;
  String? name;
  String? fatherName;
  String? motherName;
  String? date;
  String? image;
  ViewEmployeePersonalInfoWidget({
    required this.id,
    required this.isActive,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.date,
    required this.size,
    required this.image,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ViewEmployeePresonalImageWidget(
                updateImage:
                    () => context
                        .read<ViewUpdateEmployeeBloc>()
                        .employeesMiddleware
                        .updateImage(context.read<MemberImageCubit>()),
                size: size,
                image: image,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ViewEmployeeIdTextWidget(
                    id: id,
                    size: size,
                    widthSizeFactor: .15,
                  ),
                  ViewEmployeeTextfieldWidget(
                    initialInfo: name!,
                    validate: (value) => Validations.getNameValidation(value),
                    onChange:
                        (value) => context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .setFullName(value),
                    title: 'full name',
                    size: size,
                    focusNode: FocusNode(),
                    nextFocusNode:
                        context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .getfatherNameFocusNode(),
                    widthSizeFactor: .15,
                  ),
                  ViewEmployeeTextfieldWidget(
                    initialInfo: fatherName,
                    validate: (value) => Validations.getNameValidation(value),
                    onChange:
                        (value) => context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .setFatherName(value),

                    title: 'father name',
                    size: size,
                    nextFocusNode:
                        context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .getmotherNameFocusNode(),
                    focusNode:
                        context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .getfatherNameFocusNode(),
                    widthSizeFactor: .15,
                  ),

                  ViewEmployeeTextfieldWidget(
                    initialInfo: motherName,
                    validate: (value) => Validations.getNameValidation(value),
                    onChange:
                        (value) => context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .setMotherName(value),

                    title: 'mother name',
                    size: size,
                    nextFocusNode:
                        context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .getPasswordFocusNode(),
                    focusNode:
                        context
                            .read<ViewUpdateEmployeeBloc>()
                            .employeesMiddleware
                            .getmotherNameFocusNode(),
                    widthSizeFactor: .15,
                  ),
                ],
              ),
            ],
          ),
          ViewEmployeeBirthDateWidget(size: size, date: date),
          AddEmployeeCitiesTypesWidget(size: size),
          SizedBox(
            width: size.width * .35,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [ActievRadioButtonWidget(id: id)],
            ),
          ),
        ],
      ),
    );
  }
}
