import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SetDesicionButtonWidget extends StatelessWidget {
  String title;
  Size size;
  Function() onPress;
  SetDesicionButtonWidget({
    required this.onPress,
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: size.width * .1),
      decoration: BoxDecoration(
        gradient: mainGradient,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
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
