import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/check_code_bloc.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../util/colors/colors.dart';

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
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please insert password';
          }
          return null;
        },
        autofocus: true,

        onChanged:
            (value) => context
                .read<CheckCodeBloc>()
                .authMiddleware
                .setCheckCode(value),
        style: TextStyle(fontWeight: FontWeight.bold),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          label: Text('check code', style: getVariableTitleStyle(size)),
          maintainHintHeight: true,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.code, color: textFieldIcons),
        ),
      ),
    );
  }
}
