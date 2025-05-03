import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../util/colors/colors.dart';

// ignore: must_be_immutable
class CheckCodeButtonWidget extends StatelessWidget {
  Size size;
  CheckCodeButtonWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: size.width * .14,
      height: 50,
      decoration: BoxDecoration(
        gradient: mainGradient,
        borderRadius: BorderRadius.circular(15),
      ),

      child: ElevatedButton(
        onPressed: () => context.read<LoginPagesCubit>().moveToResetPassword(),

        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: const Color.fromARGB(0, 255, 255, 255),
        ),
        child: Text(
          'check',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
