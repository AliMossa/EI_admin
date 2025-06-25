import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';

class LoginLogoutViewDateWidget extends StatelessWidget {
  String title;
  String date;
  Color color;
  Size size;
  double textWidth;
  LoginLogoutViewDateWidget({
    required this.textWidth,
    required this.size,
    required this.title,
    required this.date,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: textWidth,
              ),
            ),
            const SizedBox(width: 10),
            Text(date, style: getprofileLogginDateStyle(size)),
          ],
        ),
      ),
    );
  }
}
