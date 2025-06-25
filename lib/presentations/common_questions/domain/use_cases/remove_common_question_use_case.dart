import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/repositories/common_questions_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class RemoveCommonQuestionUseCase {
  CommonQuestionsRepository commonQuestionsRepository;
  RemoveCommonQuestionUseCase({required this.commonQuestionsRepository});
  Future<Either<AdminExceptions, String>> call(
    RemoveCommonQuestionEntity removeCommonQuestions,
  ) async {
    return await commonQuestionsRepository.removeCommonQuestions(
      removeCommonQuestions,
    );
  }
}
