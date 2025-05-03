import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/login_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class EmailTextFieldWidget extends StatelessWidget {
  Size size;
  EmailTextFieldWidget({required this.size, super.key});

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
        onFieldSubmitted:
            (_) => FocusScope.of(context).requestFocus(
              context.read<LoginBloc>().authMiddleware.getPasswordFocuNode(),
            ),
        style: TextStyle(fontWeight: FontWeight.bold),

        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          hintText: 'email',
          maintainHintHeight: true,
          hintStyle: TextStyle(fontWeight: FontWeight.bold),
          border: InputBorder.none,
          suffixIcon: Icon(Icons.email, color: textFieldIcons),
        ),
      ),
    );
  }
}
