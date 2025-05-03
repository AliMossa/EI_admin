import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/employees_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class EmployeeInfoTextfieldWidget extends StatelessWidget {
  String title;
  String initialInfo;
  Size size;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  EmployeeInfoTextfieldWidget({
    this.initialInfo = '',
    required this.focusNode,
    required this.size,
    required this.title,
    required this.nextFocusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: profileTitleLogginDateStyle),
          Container(
            width: size.width * .15,
            height: 30,
            padding: EdgeInsets.only(left: 5, right: 5),
            margin: EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: linkColor),
              color: textFieldInside,
            ),
            child: TextFormField(
              onFieldSubmitted:
                  (_) => FocusScope.of(context).requestFocus(nextFocusNode),
              maxLines: 1,
              focusNode: focusNode,
              maxLength: 19,
              autofocus: true,
              cursorHeight: smallSize,
              initialValue: initialInfo,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ],
      ),
    );
  }
}
