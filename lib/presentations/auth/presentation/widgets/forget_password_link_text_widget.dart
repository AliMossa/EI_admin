import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordLinkTextWidget extends StatelessWidget {
  const ForgetPasswordLinkTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('forget'),
          InkWell(
            onTap: () => context.read<LoginPagesCubit>().moveToCheckCode(),
            child: Text(' password?', style: linkStyle),
          ),
          SizedBox(width: 30),
        ],
      ),
    );
  }
}
