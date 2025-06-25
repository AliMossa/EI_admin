import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/repositories/common_questions_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetCommonQuestionsUseCase {
  CommonQuestionsRepository commonQuestionsRepository;
  GetCommonQuestionsUseCase({required this.commonQuestionsRepository});

  Future<Either<AdminExceptions, TotalCommonQuestionsEntity>> call() async {
    return await commonQuestionsRepository.getCommonQuestions();
  }
}
