import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../../util/sizes/fonts_sizes.dart';

class LoginTitleWidget extends StatelessWidget {
  const LoginTitleWidget({super.key});

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

          style: TextStyle(
            fontWeight: FontWeight.bold,

            fontSize: slangNamMiniSize,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(width: 20),
        Text(
          'EI',
          overflow: TextOverflow.ellipsis,
          softWrap: true,
          textWidthBasis: TextWidthBasis.parent,

          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
            fontSize: slangNamSize,
            foreground:
                Paint()
                  ..shader = mainGradient.createShader(
                    Rect.fromLTRB(0, 0, 200, 70),
                  ),
          ),
        ),
      ],
    );
  }
}
