import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class PropertyTypeWidget extends StatelessWidget {
  String title;
  Size size;
  PropertyTypeWidget({required this.title, required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Container(
            margin: EdgeInsets.only(right: 10),
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: statusBorderColor,
              border: Border.all(color: searchBarInside, width: 2),
              shape: BoxShape.circle,
            ),
          ),
          Text(title, style: getProfileTitleLogginDateStyle(size)),
        ],
      ),
    );
  }
}
