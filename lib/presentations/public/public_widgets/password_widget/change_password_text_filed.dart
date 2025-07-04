import 'package:admin_dashboard/presentations/public/public_widgets/password_widget/password_widget.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class ChangePasswordTextFiled extends StatelessWidget {
  String title;
  FocusNode currentFocusNode;
  FocusNode nextFocusNode;
  Size size;
  Function(String?) validation;
  Function(String) onChange;
  ChangePasswordTextFiled({
    required this.title,
    required this.currentFocusNode,
    required this.nextFocusNode,
    required this.size,
    required this.validation,
    required this.onChange,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PasswordWidget(
      validate: validation,
      onChange: onChange,

      title: title,
      size: size,
      nextFocusNode: FocusNode(),
      currentFocusNode: FocusNode(),
      widthSizeFactor: .3,
      // mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
