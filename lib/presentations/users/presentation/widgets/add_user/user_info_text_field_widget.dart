import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserInfoTextFieldWidget extends StatelessWidget {
  String title;
  String initialInfo;
  Size size;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  double widthSizeFactor;
  Function onChange;
  Function(String?) validator;

  UserInfoTextFieldWidget({
    this.initialInfo = '',
    required this.onChange,
    required this.validator,
    required this.focusNode,
    required this.size,
    required this.title,
    required this.nextFocusNode,
    required this.widthSizeFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(title, style: variableTitleStyle),
        FittedBox(
          child: Container(
            width: size.width * widthSizeFactor,
            height: 40,
            padding: EdgeInsets.only(left: 5, right: 5),
            margin: EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: linkColor),
              color: textFieldInside,
            ),
            child: TextFormField(
              validator: (value) => validator(value),
              style: getProfileTitleLogginDateStyle(size),
              onChanged: (value) => onChange(value),
              onFieldSubmitted:
                  (_) => FocusScope.of(context).requestFocus(nextFocusNode),
              focusNode: focusNode,
              autovalidateMode: AutovalidateMode.onUserInteraction,

              autofocus: true,
              cursorHeight: smallSize,
              initialValue: initialInfo,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          ),
        ),
      ],
    );
  }
}
