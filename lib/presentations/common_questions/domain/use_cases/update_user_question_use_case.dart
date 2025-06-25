import 'package:admin_dashboard/presentations/common_questions/domain/entities/update_user_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/repositories/common_questions_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UpdateUserQuestionUseCase {
  CommonQuestionsRepository commonQuestionsRepository;
  UpdateUserQuestionUseCase({required this.commonQuestionsRepository});
  Future<Either<AdminExceptions, String>> call(
    UpdateUserQuestionEntity updateUserCommonQuestionEntity,
  ) async {
    return await commonQuestionsRepository.updateUserQuestion(
      updateUserCommonQuestionEntity,
    );
  }
}
