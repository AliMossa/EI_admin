import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DesicionTextFormFieldWidget extends StatelessWidget {
  String label;
  Size size;
  Function onChange;
  Function(String?) validate;
  Function(String?) onSubmiteed;
  DesicionTextFormFieldWidget({
    required this.label,
    required this.size,
    required this.onChange,
    required this.validate,
    required this.onSubmiteed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: linkColor),
        color: textFieldInside,
      ),
      child: TextFormField(
        minLines: 1,
        maxLines: 10,
        onFieldSubmitted: (value) => onSubmiteed(value),
        validator: (value) => validate(value),
        onChanged: (value) => onChange(value),
        style: getProfileTitleLogginDateStyle(size),
        autofocus: true,
        cursorHeight: smallSize,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(label),
        ),
      ),
    );
  }
}
