import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewEmployeeBirthDateWidget extends StatelessWidget {
  Size size;
  String? date;
  ViewEmployeeBirthDateWidget({
    required this.date,
    required this.size,
    super.key,
  });

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
                Text('birth date', style: getVariableTitleStyle(size)),
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
                                .watch<ViewUpdateEmployeeBloc>()
                                .employeesMiddleware
                                .getDateBirth(),
                            style: getProfileTitleLogginDateStyle(size),
                          )
                          : date == null
                          ? SizedBox()
                          : Text(
                            date!,
                            style: getProfileTitleLogginDateStyle(size),
                          ),
                      InkWell(
                        onTap:
                            () => context
                                .read<ViewUpdateEmployeeBloc>()
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
