import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Center(child: CircularProgressIndicator(color: textFieldBorder)),
    );
  }
}
