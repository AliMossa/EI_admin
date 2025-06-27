import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MoneyTextWidget extends StatelessWidget {
  String titel;
  String value;
  Size size;
  MoneyTextWidget({
    required this.titel,
    required this.value,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: textFieldBorder),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white60,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$titel :', style: getProfileTitleLogginDateStyle(size)),
          Text(value, style: getMoneytTextStyle(size)),
        ],
      ),
    );
  }
}
