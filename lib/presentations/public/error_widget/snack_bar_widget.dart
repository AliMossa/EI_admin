import 'package:flutter/material.dart';

class SnackBarWidget {
  void show(BuildContext context, String content, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        showCloseIcon: true,
        backgroundColor: color,
        content: Text(content),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
