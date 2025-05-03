import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/login_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/colors/colors.dart';

// ignore: must_be_immutable
class ResetPasswordTextFieldWidget extends StatelessWidget {
  Size size;
  ResetPasswordTextFieldWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PasswordCubit>(
      create: (context) => PasswordCubit(),
      child: BlocBuilder<PasswordCubit, PasswordState>(
        builder: (context, state) {
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
                    context
                        .read<LoginBloc>()
                        .authMiddleware
                        .getConfirmPasswordFocusNode(),
                  ),
              style: TextStyle(fontWeight: FontWeight.bold),
              obscureText: state is ShowPasswordState ? false : true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                hintText: 'new password',
                maintainHintHeight: true,
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
