import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NoticeCancleButtonWidget extends StatelessWidget {
  const NoticeCancleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: cancleColor),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () => context.pop(),
        child: Text('cancel', style: const TextStyle(color: cancleColor)),
      ),
    );
  }
}
