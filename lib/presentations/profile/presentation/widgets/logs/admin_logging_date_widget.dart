import 'package:admin_dashboard/presentations/profile/presentation/widgets/login_logout_view_date_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminLoggingDateWidget extends StatelessWidget {
  Size size;
  String loggingIn;
  String loggingOut;
  AdminLoggingDateWidget({
    required this.size,
    required this.loggingIn,
    required this.loggingOut,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LoginLogoutViewDateWidget(
          size: size,

          textWidth: size.width * .01,
          color: Colors.green,
          date: loggingIn,
          title: 'logged in',
        ),
        LoginLogoutViewDateWidget(
          size: size,

          textWidth: size.width * .01,
          color: Colors.red,
          date: loggingOut,
          title: 'logged out',
        ),
      ],
    );
  }
}
