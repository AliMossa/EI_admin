// ignore: must_be_immutable
import 'package:admin_dashboard/presentations/auth/presentation/logic/set_email_check_code/set_email_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SetEmailCheckCodeTextFieldWidget extends StatelessWidget {
  Size size;
  SetEmailCheckCodeTextFieldWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: textFieldBorder),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'please insert email';
          } else if (value.length <= 4 ||
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            return 'please insert correct emial';
          }
          return null;
        },
        onChanged:
            (value) =>
                context.read<SetEmailBloc>().authMiddleware.setEmail(value),
        onFieldSubmitted:
            (_) => FocusScope.of(context).requestFocus(
              context.read<SetEmailBloc>().authMiddleware.getPasswordFocuNode(),
            ),
        style: TextStyle(fontWeight: FontWeight.bold),
        autofocus: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          label: Text('email', style: getVariableTitleStyle(size)),
          maintainHintHeight: true,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.email, color: textFieldIcons),
        ),
      ),
    );
  }
}
