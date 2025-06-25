import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RewardItemWidget extends StatelessWidget {
  Size size;
  String level;
  Function() function;
  RewardItemWidget({
    required this.level,
    required this.size,
    required this.function,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: GridTile(
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            gradient: mainGradient2,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: linkColor),
          ),
          child: Center(
            child: Text(
              level,
              style: getRewardsGridStyle(size),
              softWrap: true,
            ),
          ),
        ),
      ),
    );
  }
}
