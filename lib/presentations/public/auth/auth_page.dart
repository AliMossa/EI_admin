import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: mainGradient),
        child: Center(
          child: Container(
            constraints: BoxConstraints(minWidth: 600, minHeight: 500),

            width: moreInfo.width * .6,
            height: moreInfo.height * .6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: white75,
            ),
            child: Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Assets.images.loginImage.image(
                      fit: BoxFit.cover,
                      isAntiAlias: true,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<AuthBloc, AuthState>(
                    builder:
                        (context, state) => context
                            .read<AuthBloc>()
                            .authWidgetMiddleware
                            .getCorrectAuthPage(state, moreInfo),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
