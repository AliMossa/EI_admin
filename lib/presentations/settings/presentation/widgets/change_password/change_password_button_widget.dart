import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/settings/presentation/logic/bloc/password_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ChangePasswordButtonWidget extends StatelessWidget {
  String title;
  Function() onPressed;
  Size size;

  ChangePasswordButtonWidget({
    required this.title,
    required this.onPressed,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordBloc, PasswordState>(
      builder: (context, state) {
        return state is LoadingChangePasswordState
            ? LoadingWidget()
            : Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 90),
              height: 50,
              decoration: BoxDecoration(
                gradient: mainGradient,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  backgroundColor: generalButtonColor,
                ),
                child: Text(title, style: getButtonStyle(size)),
              ),
            );
      },
    );
  }
}
