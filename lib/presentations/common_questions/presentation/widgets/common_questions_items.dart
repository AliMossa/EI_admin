import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/cubit/types_cubit.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/common_question_shared_items_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonQuestionsItems extends StatelessWidget {
  const CommonQuestionsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context1, pageState) =>
              BlocListener<CommonQuestionsBloc, CommonQuestionsState>(
                listener:
                    (context, state) => context
                        .read<CommonQuestionsBloc>()
                        .commonQuestionMiddleware
                        .showCurrentState(context, state),
                child: BlocListener<TypesCubit, TypesState>(
                  listener:
                      (context2, state) => context
                          .read<TypesCubit>()
                          .commonQuestionMiddleware
                          .showCurrentStateInTypes(context2, state),
                  child: Stack(
                    children: [
                      AnimatedOpacity(
                        opacity: pageState is MoveToQuestionsPageState ? 1 : 0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInBack,

                        child:
                            pageState is MoveToQuestionsPageState
                                ? CommonQuestionSharedItemsWidget(
                                  userGlobalKey:
                                      context
                                          .read<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .getUserAnimatedGlobalKey(),
                                  globalKey:
                                      context
                                          .read<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .getAnimatedGlobalKey(),
                                  selectedType:
                                      context
                                          .watch<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .getQuestionsTypeValue(),
                                  adminTemp:
                                      context
                                          .watch<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .tempCommonQuestions,
                                  items:
                                      context
                                          .watch<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .getCommonQuestions(),
                                  userItems:
                                      context
                                          .watch<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .getUsersCommonQuestions(),
                                  userTemp:
                                      context
                                          .watch<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .tempUserQuestions,

                                  types:
                                      context
                                          .watch<CommonQuestionsBloc>()
                                          .commonQuestionMiddleware
                                          .getQuestionsTypes(),
                                  size: moreInfo,
                                )
                                : SizedBox(),
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
}
