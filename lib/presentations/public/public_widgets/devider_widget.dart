import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

class DeviderWidget extends StatelessWidget {
  const DeviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: selecteSideBarItem2,
      thickness: 3,
      endIndent: 10,
      indent: 10,
    );
  }
}
