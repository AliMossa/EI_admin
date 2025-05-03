import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../util/colors/colors.dart';

// ignore: must_be_immutable
class CheckCodeTextFieldWidget extends StatelessWidget {
  Size size;
  CheckCodeTextFieldWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.all(10),
      height: 50,
      width: size.width * .25,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: textFieldBorder),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        style: TextStyle(fontWeight: FontWeight.bold),

        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'check code',
          maintainHintHeight: true,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.code, color: textFieldIcons),
        ),
      ),
    );
  }
}
