import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTitleWidget extends StatelessWidget {
  String statement;
  AuthTitleWidget({required this.statement, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        statement,
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
    );
  }
}
