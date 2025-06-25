import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewEmployeeTextfieldWidget extends StatelessWidget {
  String title;
  String? initialInfo;
  Size size;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  double widthSizeFactor;
  Function onChange;
  Function(String?) validate;
  ViewEmployeeTextfieldWidget({
    this.initialInfo = '',
    required this.validate,
    required this.focusNode,
    required this.onChange,
    required this.size,
    required this.title,
    required this.nextFocusNode,
    required this.widthSizeFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUpdateEmployeeBloc, ViewUpdateEmployeeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title, style: variableTitleStyle),
            FittedBox(
              child: Container(
                width: size.width * widthSizeFactor,
                height: 40,
                padding: EdgeInsets.only(left: 5, right: 5, top: 4),
                margin: EdgeInsets.only(left: 20, top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: linkColor),
                  color: textFieldInside,
                ),
                child: TextFormField(
                  validator: (value) => validate(value),
                  onChanged: (value) => onChange(value),
                  style: getProfileTitleLogginDateStyle(size),
                  onFieldSubmitted:
                      (_) => FocusScope.of(context).requestFocus(nextFocusNode),
                  focusNode: focusNode,
                  autofocus: true,
                  cursorHeight: smallSize,
                  initialValue: initialInfo ?? '',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
