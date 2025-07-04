import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/password_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/login/login_bloc.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/colors/colors.dart';

// ignore: must_be_immutable
class PasswordTextFieldWidget extends StatelessWidget {
  Size size;

  PasswordTextFieldWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordCubit>(
      create: (context) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, PasswordState>(
        builder: (context, state) {
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
                  return 'please insert password';
                } else if (value.length <= 5) {
                  return 'please insert more than 5 characters';
                }
                return null;
              },
              onChanged:
                  (value) => context
                      .read<LoginBloc>()
                      .authMiddleware
                      .setPassword(value),
              focusNode:
                  context
                      .read<LoginBloc>()
                      .authMiddleware
                      .getPasswordFocuNode(),
              style: TextStyle(fontWeight: FontWeight.bold),
              obscureText: state is ShowPasswordState ? false : true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                label: Text('password', style: getVariableTitleStyle(size)),

                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                border: InputBorder.none,
                suffixIcon: InkWell(
                  onTap: () => context.read<PasswordCubit>().changeView(),
                  child:
                      state is ShowPasswordState
                          ? Icon(Icons.visibility, color: textFieldIcons)
                          : Icon(Icons.visibility_off, color: textFieldIcons),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
