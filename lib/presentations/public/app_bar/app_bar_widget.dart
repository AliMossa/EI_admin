import 'package:admin_dashboard/presentations/public/app_bar/widgets/search_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/devider_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../util/font/font_styles.dart';

// ignore: must_be_immutable
class AppBarWidget extends StatelessWidget {
  String title;
  Size size;

  AppBarWidget({required this.title, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * .83,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(title, style: titleBarStyle),
              ),
              SearchBarWidget(size: size),
            ],
          ),
          SizedBox(width: size.width * .83, child: DeviderWidget()),
        ],
      ),
    );
  }
}
