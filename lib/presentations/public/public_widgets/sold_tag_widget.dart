import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

class SoldTagWidget extends StatelessWidget {
  Size size;
  SoldTagWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      transform: Matrix4.rotationZ(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: soldGradiant,
      ),
      child: Center(child: Text('Sold', style: getSoldPropertyStyle(size))),
    );
  }
}
