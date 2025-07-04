import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NegotiationStatusWidget extends StatelessWidget {
  String date;
  Size size;
  NegotiationStatusWidget({required this.date, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),

      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: statusNegotiationBackgroundColor,
        border: Border.all(color: statusNegotiationBorderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.chat, color: negotiationStatusIconColor, size: normalSize),
          SizedBox(width: 5),
          Text('negotiation accepted', style: getemployeesStatusStyle(size)),
          SizedBox(width: 5),

          Text(date, style: getemployeesStatusStyle(size)),
        ],
      ),
    );
  }
}
