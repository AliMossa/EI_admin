import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatusItemWidget extends StatelessWidget {
  Size size;
  String status;
  String date;
  StatusItemWidget({
    required this.date,
    required this.status,
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
          Row(
            children: [
              Icon(Icons.wifi, color: statusIconColor, size: normalSize),
              Text(status, style: getemployeesStatusStyle(size)),
            ],
          ),
          SizedBox(width: 1),
          Text(date, style: getemployeesStatusStyle(size)),
        ],
      ),
    );
  }
}
