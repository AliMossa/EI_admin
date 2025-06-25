import 'package:admin_dashboard/presentations/public/public_widgets/view_member_info_button_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QuestionItemListWidget extends StatelessWidget {
  Size size;
  String name;
  List<Widget> status;
  Widget trailing;
  String date;
  Function() onPressed;
  QuestionItemListWidget({
    this.trailing = const SizedBox(),
    required this.onPressed,
    required this.size,
    required this.name,
    required this.status,
    this.date = '',
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: linkColor),
        gradient: mainGradient2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(name, style: getProfileTitleLogginDateStyle(size)),

        trailing: SizedBox(
          width: trailing is SizedBox ? size.width * .06 : size.width * .09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ViewMemberInfoButtonWidget(onPressed: onPressed),
              trailing,
            ],
          ),
        ),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * .028,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: status,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
