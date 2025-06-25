import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddEmployeeBirthDateWidget extends StatelessWidget {
  Size size;
  AddEmployeeBirthDateWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DateCubit>(
      create: (context) => DateCubit(),
      child: BlocBuilder<DateCubit, DateState>(
        builder: (context, state) {
          return SizedBox(
            width: size.width * .25,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('birth date', style: variableTitleStyle),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      state is SetDateState
                          ? Text(
                            context
                                .watch<AddEmployeeBloc>()
                                .employeesMiddleware
                                .getDateBirth(),
                            style: getProfileTitleLogginDateStyle(size),
                          )
                          : SizedBox(),

                      InkWell(
                        onTap:
                            () => context
                                .read<AddEmployeeBloc>()
                                .employeesMiddleware
                                .setDate(context),
                        child: Icon(Icons.calendar_month_rounded),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
