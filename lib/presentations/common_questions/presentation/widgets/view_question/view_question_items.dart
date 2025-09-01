import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/bloc/view_update_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/view_question_items_list.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/view_user_question_items_list.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewQuestionItems extends StatelessWidget {
  const ViewQuestionItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<ViewUpdateQuestionBloc, ViewUpdateQuestionState>(
      listener: (context, state) {
        if (state is SuccessUpdateAdminCommonQuestionState) {
          context.read<ChangePageBloc>().add(
            MoveToQuestionsPageEvent(title: 'Questions'),
          );
        }
      },
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, pageState) {
          return AnimatedOpacity(
            opacity: pageState is MoveToViewCommonQuestionPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                pageState is MoveToViewCommonQuestionPageState
                    ? context
                                .watch<ViewUpdateQuestionBloc>()
                                .commonQuestionMiddleware
                                .getQuestionsTypeValue() ==
                            0
                        ? ViewQuestionItemsList(
                          onPress:
                              () => context.read<ChangePageBloc>().add(
                                MoveToViewCommonQuestionPageEvent(
                                  title: 'Question',
                                ),
                              ),

                          size: moreInfo,
                          commonQuestionsEntity:
                              context
                                  .watch<ViewUpdateQuestionBloc>()
                                  .commonQuestionMiddleware
                                  .getUpdateCommonQuestion(),
                        )
                        : ViewUserQuestionItemsList(
                          onPress:
                              () => context.read<ChangePageBloc>().add(
                                MoveToViewCommonQuestionPageEvent(
                                  title: 'Question',
                                ),
                              ),

                          size: moreInfo,
                          commonQuestionsEntity:
                              context
                                  .watch<ViewUpdateQuestionBloc>()
                                  .commonQuestionMiddleware
                                  .getUserUpdateCommonQuestion(),
                        )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
