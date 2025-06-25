import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ViewUserVariableWidget extends StatelessWidget {
  String title;
  String value;
  Size size;
  double widthSizeFactor;

  ViewUserVariableWidget({
    required this.value,
    required this.size,
    required this.title,
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
            padding: EdgeInsets.only(left: 5, right: 5, top: 10),
            margin: EdgeInsets.only(left: 20, top: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: linkColor),
              color: textFieldInside,
            ),
            child: Text(value, style: getProfileTitleLogginDateStyle(size)),
          ),
        ),
      ],
    );
  }
}
