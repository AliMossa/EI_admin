import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

class ViewedTagWidget extends StatelessWidget {
  const ViewedTagWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      transform: Matrix4.rotationZ(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: soldLineColor,
      ),
      child: Center(heightFactor: 0.6, child: Icon(Icons.play_arrow_rounded)),
    );
    ;
  }
}
