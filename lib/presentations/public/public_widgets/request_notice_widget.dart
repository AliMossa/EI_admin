import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RequestNoticeWidget extends StatelessWidget {
  Size size;
  bool isDirector;
  String content;
  RequestNoticeWidget({
    required this.size,
    required this.content,
    this.isDirector = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .4,
      padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: linkColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isDirector
              ? Text('Director notice:', style: inActiveSwitchIconStyle)
              : Text('Negotiation offer:', style: activeSwitchIconStyle),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),

            child: Text(content, style: profileTitleLogginDateStyle1),
          ),
        ],
      ),
    );
  }
}
