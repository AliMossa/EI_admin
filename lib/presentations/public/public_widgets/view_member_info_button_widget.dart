import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ViewMemberInfoButtonWidget extends StatelessWidget {
  Function() onPressed;
  ViewMemberInfoButtonWidget({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: linkColor),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
          backgroundColor: Colors.white,
        ),
        child: Text(
          'view',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
    );
  }
}
