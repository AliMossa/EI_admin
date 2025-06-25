import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MonitoringHistoryItem extends StatelessWidget {
  String title;
  String time;
  Size size;

  MonitoringHistoryItem({
    required this.time,
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: imageackground,
        border: Border.all(color: linkColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text(title, style: getProfileTitleLogginDateStyle(size)),
        subtitle: Text(time, style: profileLogginDateStyle),
      ),
    );
  }
}
