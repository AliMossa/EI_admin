import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddDateWidget extends StatelessWidget {
  String title;
  String birth;
  Size size;
  Function() onPress;
  AddDateWidget({
    required this.title,
    required this.birth,
    required this.size,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .25,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: variableTitleStyle),
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
                Text(birth, style: getProfileTitleLogginDateStyle(size)),

                InkWell(
                  onTap: onPress,
                  child: Icon(Icons.calendar_month_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
