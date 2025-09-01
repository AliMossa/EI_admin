import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/bloc/view_update_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/answer_text_field_widget.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/update_question_button_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUserQuestionItemsList extends StatelessWidget {
  Size size;
  UserCommonQuestionEntity commonQuestionsEntity;
  Function() onPress;
  ViewUserQuestionItemsList({
    required this.commonQuestionsEntity,
    required this.size,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewUpdateQuestionBloc, ViewUpdateQuestionState>(
      listener:
          (context, state) => context
              .read<ViewUpdateQuestionBloc>()
              .commonQuestionMiddleware
              .showUserCurrentState(context, state),
      child: Container(
        width: size.width * .5,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: textFieldBorder),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                commonQuestionsEntity.question.isNotEmpty
                    ? IconButton(
                      onPressed:
                          () => context
                              .read<ViewUpdateQuestionBloc>()
                              .commonQuestionMiddleware
                              .removeUserCommonQuestionNotice(
                                context,
                                context.read<ViewUpdateQuestionBloc>(),
                                context.read<ViewUpdateQuestionBloc>().state,

                                commonQuestionsEntity.id,
                              ),
                      icon: Icon(Icons.delete, color: Colors.red),
                    )
                    : const SizedBox(),
              ],
            ),

            Container(
              width: size.width * .8,

              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: linkColor),
                color: textFieldInside,
              ),
              child: Text(
                commonQuestionsEntity.question,
                style: getProfileTitleLogginDateStyle(size),
              ),
            ),
            AnswerTextFieldWidget(
              initialInfo: commonQuestionsEntity.answer ?? '',
              widthSizeFactor: .8,
              size: size,
              nextFocusNode: FocusNode(),
              focusNode:
                  context
                      .watch<ViewUpdateQuestionBloc>()
                      .commonQuestionMiddleware
                      .getAnswerFocusNode(),
              title: 'answer',
            ),
            UpdateQuestionButtonWidget(
              size: size,
              title: 'answer',
              onPress:
                  () => context.read<ViewUpdateQuestionBloc>().add(
                    UpdateAdminCommonQuestionEvent(
                      id: commonQuestionsEntity.id,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
