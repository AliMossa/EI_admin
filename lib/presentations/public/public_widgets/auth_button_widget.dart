import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthButtonWidget extends StatelessWidget {
  String title;
  Function() onPressed;

  AuthButtonWidget({required this.title, required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      height: 50,
      decoration: BoxDecoration(
        gradient: mainGradient,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
