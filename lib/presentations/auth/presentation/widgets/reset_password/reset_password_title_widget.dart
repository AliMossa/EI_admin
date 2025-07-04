import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ResetPasswordTitleWidget extends StatelessWidget {
  const ResetPasswordTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Reset your Password',
      softWrap: true,
      textWidthBasis: TextWidthBasis.parent,
      overflow: TextOverflow.ellipsis,

      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: slangNamMiniSize,
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
    );
  }
}
