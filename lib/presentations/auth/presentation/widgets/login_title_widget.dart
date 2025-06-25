import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

import '../../../../util/sizes/fonts_sizes.dart';

class LoginTitleWidget extends StatelessWidget {
  Size size;
  LoginTitleWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 20),

        Text(
          'Welcom again in',
          softWrap: true,
          textWidthBasis: TextWidthBasis.parent,
          overflow: TextOverflow.ellipsis,

          style: getWelcomStyle(size),
        ),
        const SizedBox(width: 20),
        Text(
          'EI',
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          textWidthBasis: TextWidthBasis.parent,

          style: getSlangNameStyle(size),
        ),
      ],
    );
  }
}
