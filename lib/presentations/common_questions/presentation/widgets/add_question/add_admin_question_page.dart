import 'package:admin_dashboard/presentations/common_questions/data/repositories_imp_source/common_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/add_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/add_admin_question/add_admin_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/add_question/add_admin_question_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdminQuestionPage extends StatelessWidget {
  final CommonQuestionMiddleware _commonQuestionMiddleware =
      CommonQuestionMiddleware.get();
  AddAdminQuestionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => AddAdminQuestionBloc(
                addCommonQuestionUseCase: AddCommonQuestionUseCase(
                  commonQuestionsRepository: CommonRepositoryImpSource(),
                ),
                commonQuestionMiddleware: _commonQuestionMiddleware,
              ),
        ),
      ],
      child: AddAdminQuestionItems(),
    );
  }
}
