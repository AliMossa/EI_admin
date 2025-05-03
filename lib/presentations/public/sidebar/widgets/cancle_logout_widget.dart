import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CancleLogoutWidget extends StatelessWidget {
  const CancleLogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.red),
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextButton(
        onPressed: () => context.pop(),
        child: Text("", style: const TextStyle(color: Colors.red)),
      ),
    );
  }
}
