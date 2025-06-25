import 'package:flutter/material.dart';

class ShowNoticeWidget {
  static void showNotice(
    BuildContext context,
    Widget title,
    Widget content,
    Widget actions,
    Icon icon,
  ) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: content,
            actions: [actions],
            title: title,
            backgroundColor: Colors.white,
            icon: icon,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
    );
  }
}
