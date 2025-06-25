import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/admin_common_question_list_widget.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/user_common_questions_list_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CommonQuestionsListWidget extends StatelessWidget {
  int selectedType;
  Size size;
  TotalCommonQuestionsEntity items;
  List<CommonQuestionsEntity> adminTemp;
  List<UserCommonQuestionEntity> userTemp;
  TotalUserCommonQuestionEntity userItems;
  GlobalKey<AnimatedListState> commonQuestionGlobalKey;
  GlobalKey<AnimatedListState> userQuestionGlobalKey;

  CommonQuestionsListWidget({
    required this.commonQuestionGlobalKey,
    required this.userQuestionGlobalKey,
    required this.selectedType,
    required this.size,
    required this.userItems,
    required this.adminTemp,
    required this.userTemp,
    required this.items,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: size.height * .76,
          width: size.width * .8,
          child:
              selectedType == 0
                  ? AdminCommonQuestionListWidget(
                    temp: adminTemp,
                    size: size,
                    globalKey: commonQuestionGlobalKey,
                    items: items,
                  )
                  : UserCommonQuestionsListWidget(
                    temp: userTemp,
                    size: size,
                    items: userItems,
                    globalKey: userQuestionGlobalKey,
                  ),
        ),
      ],
    );
  }
}
