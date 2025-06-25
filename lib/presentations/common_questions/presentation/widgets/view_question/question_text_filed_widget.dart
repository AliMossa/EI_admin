import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class QuestionTextFiledWidget extends StatelessWidget {
  String title;
  String initialInfo;
  Size size;
  FocusNode focusNode;
  FocusNode nextFocusNode;
  double widthSizeFactor;
  QuestionTextFiledWidget({
    this.initialInfo = '',
    required this.focusNode,
    required this.size,
    required this.title,
    required this.nextFocusNode,
    required this.widthSizeFactor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * widthSizeFactor,

      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: linkColor),
        color: textFieldInside,
      ),
      child: TextFormField(
        onChanged:
            (value) => context
                .read<CommonQuestionsBloc>()
                .commonQuestionMiddleware
                .setQuestion(value),
        keyboardType: TextInputType.multiline,
        maxLines: null,
        style: getProfileTitleLogginDateStyle(size),
        onFieldSubmitted:
            (_) => FocusScope.of(context).requestFocus(nextFocusNode),
        focusNode: focusNode,
        autofocus: true,

        minLines: 1,
        cursorHeight: smallSize,
        initialValue: initialInfo,
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text(title),
        ),
      ),
    );
  }
}
