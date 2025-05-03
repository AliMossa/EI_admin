import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

class CheckCodeTitleWidget extends StatelessWidget {
  const CheckCodeTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Confirm your email',
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
