import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/cubit/types_cubit.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/models/types_drop_down_model.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/common_questions_list_widget.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_questions_type_menu_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_member_button_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CommonQuestionSharedItemsWidget extends StatelessWidget {
  TotalCommonQuestionsEntity items;
  List<CommonQuestionsEntity> adminTemp;

  TotalUserCommonQuestionEntity userItems;
  List<UserCommonQuestionEntity> userTemp;
  int selectedType;
  List<TypesDropDownModel> types;
  Size size;
  GlobalKey<AnimatedListState> globalKey;
  GlobalKey<AnimatedListState> userGlobalKey;

  CommonQuestionSharedItemsWidget({
    required this.globalKey,
    required this.userGlobalKey,
    required this.selectedType,
    required this.adminTemp,
    required this.items,
    required this.userItems,
    required this.userTemp,
    required this.size,
    required this.types,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommonQuestionsBloc, CommonQuestionsState>(
      builder:
          (context, state) => Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ViewQuestionsTypeMenuWidget(
                    size: size,
                    currntValue:
                        context
                            .watch<TypesCubit>()
                            .commonQuestionMiddleware
                            .getQuestionsTypeValue(),
                    kinds: types,
                    onPressed:
                        (value) => context
                            .read<TypesCubit>()
                            .commonQuestionMiddleware
                            .changeQuestionsType(
                              value,
                              context.read<TypesCubit>(),
                            ),
                  ),
                  CommonQuestionsListWidget(
                    userQuestionGlobalKey: userGlobalKey,
                    commonQuestionGlobalKey: globalKey,
                    size: size,
                    adminTemp: adminTemp,
                    userTemp: userTemp,
                    items: items,
                    userItems: userItems,
                    selectedType: selectedType,
                  ),
                ],
              ),
              selectedType == 0
                  ? AddMemberButtonWidget(
                    onPress:
                        () => context.read<ChangePageBloc>().add(
                          MoveToAddAdminCommonQuestionPageEvent(
                            title: 'Common Questions',
                          ),
                        ),
                  )
                  : SizedBox(),
            ],
          ),
    );
  }
}
