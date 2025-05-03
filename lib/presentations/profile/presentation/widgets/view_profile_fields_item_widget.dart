import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

class ViewProfileFieldsItemWidget extends StatelessWidget {
  Widget leading;
  Widget trailing;
  String content;
  final onPress;
  ViewProfileFieldsItemWidget({
    required this.content,
    required this.leading,
    required this.trailing,
    required this.onPress,

    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 30,
      leading: leading,
      title: Text(content, style: profileNamedFieldsStyle),
      trailing: IconButton(onPressed: onPress, icon: trailing),
    );
  }
}
