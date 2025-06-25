import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddMemberButtonWidget extends StatelessWidget {
  Function() onPress;
  AddMemberButtonWidget({required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 20,
      bottom: 30,
      child: Container(
        decoration: BoxDecoration(
          gradient: mainGradient,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ElevatedButton(
          onPressed: onPress,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: const Color.fromARGB(0, 255, 255, 255),
          ),
          child: Icon(Icons.add, color: Colors.white),
        ),
      ),
    );
  }
}
