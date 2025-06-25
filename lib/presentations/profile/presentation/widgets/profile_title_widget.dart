import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ProfileTitleWidget extends StatelessWidget {
  String name;
  String joinDate;
  Size size;
  ProfileTitleWidget({
    required this.joinDate,
    required this.name,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(name, style: getProfileNameStyle(size)),
        Text('joined in $joinDate', style: getProfileSubNameStyle(size)),
      ],
    );
  }
}
