import 'package:admin_dashboard/presentations/rewards/presentation/logic/add_reward/add_reward_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddRewardTextFied extends StatelessWidget {
  int? multiline;
  bool autofocus;
  String title;
  String initialInfo;
  Size size;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  double widthSizeFactor;
  Function(String) onChange;
  Function(String) validation;
  Widget suffix;

  AddRewardTextFied({
    this.initialInfo = '',
    this.multiline,
    required this.autofocus,
    required this.focusNode,
    required this.size,
    required this.title,
    required this.nextFocusNode,
    required this.validation,
    required this.widthSizeFactor,
    required this.onChange,
    this.suffix = const SizedBox(),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * widthSizeFactor,
      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: linkColor),
        color: textFieldInside,
      ),
      child: TextFormField(
        onChanged: onChange,
        keyboardType: TextInputType.multiline,
        maxLines: multiline,
        style: getProfileTitleLogginDateStyle(size),
        onFieldSubmitted:
            (_) => FocusScope.of(context).requestFocus(nextFocusNode),
        focusNode: focusNode,
        autofocus: autofocus,
        minLines: 1,
        cursorHeight: smallSize,
        initialValue: initialInfo,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) => validation(value!),
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(title),
          suffix: suffix,
        ),
      ),
    );
  }
}
