import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BackCheckCodeArrow extends StatelessWidget {
  const BackCheckCodeArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: textFieldIcons),
              ),
              child:
                  state is MoveToCheckCodePageState
                      ? IconButton(
                        onPressed:
                            () => context.read<AuthBloc>().add(
                              MoveToLoginPageEvent(),
                            ),
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: textFieldIcons,
                        ),
                      )
                      : SizedBox(),
            ),
            const SizedBox(width: 20),
          ],
        );
      },
    );
  }
}
