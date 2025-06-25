import 'package:admin_dashboard/presentations/common_questions/data/repositories_imp_source/common_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/get_common_questions_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/get_user_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/re_get_common_questions_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/re_get_use_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_user_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/cubit/types_cubit.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/common_questions_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonQuestionsPage extends StatelessWidget {
  final CommonQuestionMiddleware _commonQuestionMiddleware =
      CommonQuestionMiddleware.get();
  CommonQuestionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CommonQuestionsBloc>(
          create:
              (context) => CommonQuestionsBloc(
                reGetUseCommonQuestionUseCase: ReGetUseCommonQuestionUseCase(
                  commonQuestionsRepository: CommonRepositoryImpSource(),
                ),
                reGetCommonQuestionsUseCase: ReGetCommonQuestionsUseCase(
                  commonQuestionsRepository: CommonRepositoryImpSource(),
                ),
                removeUserCommonQuestionUseCase:
                    RemoveUserCommonQuestionUseCase(
                      commonQuestionsRepository: CommonRepositoryImpSource(),
                    ),
                getUserCommonQuestionUseCase: GetUserCommonQuestionUseCase(
                  commonQuestionsRepository: CommonRepositoryImpSource(),
                ),
                removeCommonQuestionUseCase: RemoveCommonQuestionUseCase(
                  commonQuestionsRepository: CommonRepositoryImpSource(),
                ),

                getCommonQuestionsUseCase: GetCommonQuestionsUseCase(
                  commonQuestionsRepository: CommonRepositoryImpSource(),
                ),
                commonQuestionMiddleware: _commonQuestionMiddleware,
              )..add(GetSuitableCommonQuestionEvent()),
        ),
        BlocProvider(
          create:
              (context) => TypesCubit(
                commonQuestionMiddleware: _commonQuestionMiddleware,
              ),
        ),
      ],
      child: CommonQuestionsItems(),
    );
  }
}
