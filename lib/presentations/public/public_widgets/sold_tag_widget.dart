import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
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
        color: soldLineColor,
      ),
      child: Center(heightFactor: 0.6, child: Icon(Icons.link_rounded)),
    );
  }
}
