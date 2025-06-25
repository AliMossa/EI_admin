import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class AdminCommonQuestionListWidget extends StatelessWidget {
  Size size;
  TotalCommonQuestionsEntity items;
  List<CommonQuestionsEntity> temp;

  GlobalKey<AnimatedListState> globalKey;
  AdminCommonQuestionListWidget({
    required this.globalKey,
    required this.temp,
    required this.items,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonQuestionsBloc, CommonQuestionsState>(
      builder:
          (context, state) => context
              .read<CommonQuestionsBloc>()
              .commonQuestionMiddleware
              .checkAdminQuestionTemp(state, size)
              .fold(
                (_) => NotificationListener(
                  onNotification: (ScrollNotification notification) {
                    if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent) {}
                    return false;
                  },
                  child: AnimatedList(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    initialItemCount: items.list.length,
                    key: globalKey,
                    itemBuilder:
                        (context, index, animation) => FadeTransition(
                          opacity: animation.drive(
                            Tween<double>(begin: 0, end: 1),
                          ),
                          child: ItemListWidget(
                            name: items.list[index].question,
                            size: size,
                            status: [],
                            date: '10-12-2025',
                            onPressed: () {
                              context
                                  .read<CommonQuestionsBloc>()
                                  .commonQuestionMiddleware
                                  .setUpdateCommonQuestion(
                                    context.read<ChangePageBloc>(),
                                    items.list[index].id,
                                  );
                            },
                            trailing: Expanded(
                              child: IconButton(
                                onPressed:
                                    () => context
                                        .read<CommonQuestionsBloc>()
                                        .commonQuestionMiddleware
                                        .removeCommonQuestionNotice(
                                          context,
                                          context.read<CommonQuestionsBloc>(),
                                          state,

                                          context.read<ChangePageBloc>(),
                                          items.list[index].id,
                                        ),
                                icon: Icon(Icons.delete, color: Colors.red),
                              ),
                            ),
                          ),
                        ),
                  ),
                ),
                (widget) => widget,
              ),
    );
  }
}
