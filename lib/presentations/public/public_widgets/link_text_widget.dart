import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

class LinkTextWidget extends StatelessWidget {
  String title;
  String coloredTitle;
  Size size;
  Function() onPressed;
  LinkTextWidget({
    required this.title,
    required this.coloredTitle,
    required this.size,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(title, style: getPreLinkStyle(size)),
          SizedBox(width: 5),
          InkWell(
            onTap: onPressed,
            child: Text(coloredTitle, style: getLinkStyle(size)),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
