import 'package:admin_dashboard/presentations/common_questions/domain/entities/add_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/update_user_question_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class CommonQuestionsRepository {
  Future<Either<AdminExceptions, TotalCommonQuestionsEntity>>
  getCommonQuestions();
  Future<Either<AdminExceptions, TotalUserCommonQuestionEntity>>
  getUserCommonQuestions(String token);

  Future<Either<AdminExceptions, TotalCommonQuestionsEntity>>
  reGetCommonQuestions(String link);
  Future<Either<AdminExceptions, TotalUserCommonQuestionEntity>>
  reGetUserCommonQuestions(String link);

  Future<Either<AdminExceptions, String>> addCommonQuestions(
    AddCommonQuestionEntity addCommonQuestionEntity,
  );

  Future<Either<AdminExceptions, String>> removeCommonQuestions(
    RemoveCommonQuestionEntity removeCommonQuestions,
  );
  Future<Either<AdminExceptions, String>> removeUserQuestion(
    RemoveCommonQuestionEntity removeAdminCommonQuestions,
  );
  Future<Either<AdminExceptions, String>> updateUserQuestion(
    UpdateUserQuestionEntity updateUserCommonQuestionEntity,
  );
}
