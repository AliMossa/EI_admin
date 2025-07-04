import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/models/cities_model.dart';
import 'package:admin_dashboard/presentations/employees/presentation/models/employee_model.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/kinds_menu_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddEmployeeCitiesTypesWidget extends StatelessWidget {
  Size size;
  AddEmployeeCitiesTypesWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: size.width * .25,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('work city', style: getVariableTitleStyle(size)),

              Container(
                width: size.width * .15,
                height: 40,
                padding: EdgeInsets.only(left: 5, right: 5),
                margin: EdgeInsets.only(left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: linkColor),
                  color: textFieldInside,
                ),

                child: KindsMenuWidget(
                  size: size,
                  kinds: CitiesModel().getCities(),
                  currntValue:
                      context
                          .watch<KindsCubit>()
                          .employeesMiddleware
                          .getBirthCity(),
                  onPressed:
                      (value) => context
                          .read<KindsCubit>()
                          .employeesMiddleware
                          .changebirthCity(value, context.read<KindsCubit>()),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width * .25,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [
              Text('employee type', style: getVariableTitleStyle(size)),
              Container(
                width: size.width * .15,
                height: 40,
                padding: EdgeInsets.only(left: 5, right: 5),
                margin: EdgeInsets.only(left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: linkColor),
                  color: textFieldInside,
                ),
                child: KindsMenuWidget(
                  size: size,
                  kinds: EmployeeModel().getEmployeesTeams(),
                  currntValue:
                      context
                          .watch<KindsCubit>()
                          .employeesMiddleware
                          .getTeamKind(),
                  onPressed:
                      (value) => context
                          .read<KindsCubit>()
                          .employeesMiddleware
                          .changeTeamKind(value, context.read<KindsCubit>()),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
