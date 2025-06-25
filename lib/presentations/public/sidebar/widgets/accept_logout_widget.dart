import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AcceptLogoutWidget extends StatelessWidget {
  String title;
  final onPressed;
  AcceptLogoutWidget({required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: textFieldBorder),
      child: Text(title, style: const TextStyle(color: Colors.white)),
    );
  }
}
