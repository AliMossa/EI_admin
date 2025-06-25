import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/bloc/view_update_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/answer_text_field_widget.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/question_text_filed_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewQuestionItemsList extends StatelessWidget {
  Size size;
  CommonQuestionsEntity commonQuestionsEntity;
  Function() onPress;
  ViewQuestionItemsList({
    required this.commonQuestionsEntity,
    required this.size,
    required this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
              commonQuestionsEntity.answer.isNotEmpty
                  ? IconButton(
                    onPressed:
                        () => context
                            .read<ViewUpdateQuestionBloc>()
                            .commonQuestionMiddleware
                            .removeCommonQuestionNoticeFromInside(
                              context,
                              context.read<ViewUpdateQuestionBloc>(),
                              context.read<ViewUpdateQuestionBloc>().state,

                              context.read<ChangePageBloc>(),
                              commonQuestionsEntity.id,
                            ),
                    icon: Icon(Icons.delete, color: Colors.red),
                  )
                  : const SizedBox(),
            ],
          ),
          QuestionTextFiledWidget(
            widthSizeFactor: .8,
            initialInfo: commonQuestionsEntity.question,
            size: size,
            nextFocusNode:
                context
                    .watch<ViewUpdateQuestionBloc>()
                    .commonQuestionMiddleware
                    .getAnswerFocusNode(),
            focusNode: FocusNode(),
            title: 'question',
          ),
          AnswerTextFieldWidget(
            initialInfo: commonQuestionsEntity.answer,
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
        ],
      ),
    );
  }
}
