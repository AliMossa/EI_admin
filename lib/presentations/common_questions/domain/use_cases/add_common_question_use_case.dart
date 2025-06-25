import 'package:admin_dashboard/presentations/common_questions/domain/entities/add_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/repositories/common_questions_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AddCommonQuestionUseCase {
  CommonQuestionsRepository commonQuestionsRepository;
  AddCommonQuestionUseCase({required this.commonQuestionsRepository});
  Future<Either<AdminExceptions, String>> call(
    AddCommonQuestionEntity addCommonQuestionEntity,
  ) async {
    return await commonQuestionsRepository.addCommonQuestions(
      addCommonQuestionEntity,
    );
  }
}
