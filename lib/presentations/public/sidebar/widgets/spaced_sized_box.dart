import 'package:flutter/material.dart';

class SpacedSizedBox extends StatelessWidget {
  Size size;
  SpacedSizedBox({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height > size.width ? size.height * .5 : size.height * .3,
    );
  }
}
