import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ProfileTitleWidget extends StatelessWidget {
  String name;
  String joinDate;
  ProfileTitleWidget({required this.joinDate, required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: profileNameStyle),
        Text(
          joinDate,
          style: TextStyle(color: black30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
