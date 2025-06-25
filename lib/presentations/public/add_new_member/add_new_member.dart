import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddNewMember extends StatelessWidget {
  Size size;
  String title;
  Function() onPress;
  AddNewMember({
    required this.onPress,
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: size.height * .1,
          left: 10,
          right: 10,
          bottom: 10,
        ),
        width: size.width * .14,
        height: 50,
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
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
