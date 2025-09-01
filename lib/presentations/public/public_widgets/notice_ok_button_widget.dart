import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NoticeOkButtonWidget extends StatelessWidget {
  String title;
  Function() function;
  NoticeOkButtonWidget({
    required this.title,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(backgroundColor: textFieldBorder),
      child: Text(title, style: TextStyle(color: selecteSideBarItem1)),
    );
  }
}
