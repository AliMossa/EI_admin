import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButtonWidget extends StatelessWidget {
  Size size;

  LoginButtonWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size.width * .14,
      height: 50,
      decoration: BoxDecoration(
        gradient: mainGradient,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ElevatedButton(
        onPressed: () => () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        child: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
