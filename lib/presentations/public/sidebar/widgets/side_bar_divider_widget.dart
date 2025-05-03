import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SideBarDividerWidget extends StatelessWidget {
  Color color;
  double thickness;
  SideBarDividerWidget({
    required this.color,
    required this.thickness,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: color,
      thickness: thickness,
      indent: 10,
      endIndent: 10,
    );
  }
}
