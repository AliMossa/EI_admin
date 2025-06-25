import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EconomicalStudyStatusWidget extends StatelessWidget {
  String date;
  Size size;
  EconomicalStudyStatusWidget({
    required this.date,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: statusBackgroundColor,
        border: Border.all(color: statusBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.wifi, color: statusIconColor, size: normalSize),
          Text(date, style: employeesStatusStyle),
        ],
      ),
    );
  }
}
