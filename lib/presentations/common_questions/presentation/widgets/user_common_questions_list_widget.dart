import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class UserCommonQuestionsListWidget extends StatelessWidget {
  Size size;
  TotalUserCommonQuestionEntity items;
  List<UserCommonQuestionEntity> temp;
  GlobalKey<AnimatedListState> globalKey;
  UserCommonQuestionsListWidget({
    required this.size,
    required this.items,
    required this.temp,
    required this.globalKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonQuestionsBloc, CommonQuestionsState>(
      builder: (context, state) {
        return NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {}
            return false;
          },
          child: AnimatedList(
            key: globalKey,
            padding: EdgeInsets.symmetric(horizontal: 5),
            initialItemCount: items.questions.length,
            itemBuilder:
                (context, index, animation) => FadeTransition(
                  opacity: animation.drive(Tween(begin: 0, end: 1)),
                  child: ItemListWidget(
                    name: items.questions[index].question,
                    size: size,
                    status: [],
                    date: items.questions[index].createDate,
                    onPressed: () {
                      context
                          .read<CommonQuestionsBloc>()
                          .commonQuestionMiddleware
                          .setUpdateUserCommonQuestion(
                            context.read<ChangePageBloc>(),
                            items.questions[index].id,
                          );
                    },
                    trailing: IconButton(
                      onPressed:
                          () => context
                              .read<CommonQuestionsBloc>()
                              .commonQuestionMiddleware
                              .removeUserCommonQuestionNotice(
                                context,
                                context.read<CommonQuestionsBloc>(),
                                state,
                                items.questions[index].id,
                              ),
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ),
          ),
        );
      },
    );
  }
}
