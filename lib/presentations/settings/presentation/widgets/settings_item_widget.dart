import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SettingsItemWidget extends StatelessWidget {
  String title;
  Icon prefix;
  Function() function;
  Size size;
  SettingsItemWidget({
    required this.title,
    required this.prefix,
    required this.function,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: linkColor),
          borderRadius: BorderRadius.circular(20),
          gradient: mainGradient2,
        ),
        child: ListTile(
          title: Text(title, style: getProfileTitleLogginDateStyle(size)),
          leading: prefix,
        ),
      ),
    );
  }
}
