import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AcceptLogoutWidget extends StatelessWidget {
  String title;
  final onPressed;
  AcceptLogoutWidget({required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      child: Text(title, style: const TextStyle(color: Colors.amber)),
    );
  }
}
