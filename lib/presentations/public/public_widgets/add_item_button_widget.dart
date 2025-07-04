import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AddItemButtonWidget extends StatelessWidget {
  String title;
  double widthFactor;
  double heightFactor;
  Size size;
  Function() onPress;
  AddItemButtonWidget({
    required this.widthFactor,
    required this.heightFactor,
    required this.onPress,
    required this.title,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * widthFactor,
        height: heightFactor,
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
            backgroundColor: addItemColor,
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
