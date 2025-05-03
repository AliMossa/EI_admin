import 'package:admin_dashboard/presentations/profile/presentation/widgets/login_logout_view_date_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdminLoggingDateWidget extends StatelessWidget {
  String loggingIn;
  String loggingOut;
  AdminLoggingDateWidget({
    required this.loggingIn,
    required this.loggingOut,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LoginLogoutViewDateWidget(
            color: Colors.green,
            date: loggingIn,
            title: 'logged in',
          ),
          const Divider(color: Colors.black, height: 20),
          LoginLogoutViewDateWidget(
            color: Colors.red,
            date: loggingOut,
            title: 'logged out',
          ),
        ],
      ),
    );
  }
}
