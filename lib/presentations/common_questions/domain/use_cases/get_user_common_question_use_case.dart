import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/repositories/common_questions_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetUserCommonQuestionUseCase {
  CommonQuestionsRepository commonQuestionsRepository;
  GetUserCommonQuestionUseCase({required this.commonQuestionsRepository});

  Future<Either<AdminExceptions, TotalUserCommonQuestionEntity>> call(
    String token,
  ) async {
    return await commonQuestionsRepository.getUserCommonQuestions(token);
  }
}
