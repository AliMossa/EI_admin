import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PieTextsWidget extends StatelessWidget {
  int value;
  String title;
  Color color;
  Size size;
  PieTextsWidget({
    required this.value,
    required this.color,
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          SizedBox(width: 20, height: 20, child: Card(color: color)),

          Text('$title: $value', style: getProfileTitleLogginDateStyle(size)),
        ],
      ),
    );
  }
}
