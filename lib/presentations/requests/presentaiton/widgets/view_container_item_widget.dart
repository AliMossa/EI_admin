import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewContainerItemWidget extends StatelessWidget {
  String title;
  Widget firstColumn;
  Widget secondColumn;
  Size size;

  ViewContainerItemWidget({
    required this.firstColumn,
    required this.title,
    this.secondColumn = const SizedBox(),
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: linkColor),
      ),
      child: Column(
        children: [
          Text(title, style: getVariableTitleStyle(size)),
          Row(children: [firstColumn, secondColumn]),
        ],
      ),
    );
  }
}
