import 'package:admin_dashboard/presentations/common_questions/data/repositories_imp_source/common_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_user_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/update_user_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/bloc/view_update_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/view_question/view_question_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewQuestionPage extends StatelessWidget {
  final CommonQuestionMiddleware _commonQuestionMiddleware =
      CommonQuestionMiddleware.get();
  ViewQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => ViewUpdateQuestionBloc(
            removeUserCommonQuestionUseCase: RemoveUserCommonQuestionUseCase(
              commonQuestionsRepository: CommonRepositoryImpSource(),
            ),
            updateUserQuestionUseCase: UpdateUserQuestionUseCase(
              commonQuestionsRepository: CommonRepositoryImpSource(),
            ),
            removeCommonQuestionUseCase: RemoveCommonQuestionUseCase(
              commonQuestionsRepository: CommonRepositoryImpSource(),
            ),
            commonQuestionMiddleware: _commonQuestionMiddleware,
          ),
      child: ViewQuestionItems(),
    );
  }
}
