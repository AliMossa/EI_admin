import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/cupertino.dart';
import '../../../../util/colors/colors.dart';

// ignore: must_be_immutable
class SearchFieldWidget extends StatelessWidget {
  Size size;
  SearchFieldWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 2),
      margin: EdgeInsets.only(right: 10),
      width: size.width * .15,
      decoration: BoxDecoration(
        color: searchBarInside,
        border: Border.all(color: textFieldBorder),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(CupertinoIcons.search, color: white75),
          const SizedBox(width: 5),
          Text('search', style: searchBarStyle),
        ],
      ),
    );
  }
}
