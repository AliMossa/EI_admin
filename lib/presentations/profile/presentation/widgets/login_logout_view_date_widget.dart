import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

class LoginLogoutViewDateWidget extends StatelessWidget {
  String title;
  String date;
  Color color;
  LoginLogoutViewDateWidget({
    required this.title,
    required this.date,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
        Text(date, style: profileLogginDateStyle),
      ],
    );
  }
}
