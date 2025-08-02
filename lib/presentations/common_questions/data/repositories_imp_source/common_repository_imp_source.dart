import 'package:admin_dashboard/presentations/common_questions/data/data_sources/add_common_question_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/get_common_questions_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/get_user_common_question_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/re_get_common_question_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/re_get_use_common_question_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/remove_common_question_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/remove_user_common_question_data_source.dart';
import 'package:admin_dashboard/presentations/common_questions/data/data_sources/update_user_common_question_data_srouce.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/add_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/update_user_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/repositories/common_questions_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class CommonRepositoryImpSource implements CommonQuestionsRepository {
  @override
  Future<Either<AdminExceptions, String>> addCommonQuestions(
    AddCommonQuestionEntity addCommonQuestionEntity,
  ) async {
    try {
      return right(
        await AddCommonQuestionDataSourceWithDio().addCommonQuestion(
          addCommonQuestionEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalCommonQuestionsEntity>>
  getCommonQuestions() async {
    try {
      return right(
        await GetCommonQuestionsDataSourceWithDio().getCommonQuestions(),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> removeCommonQuestions(
    RemoveCommonQuestionEntity removeCommonQuestions,
  ) async {
    try {
      return right(
        await RemoveCommonQuestionDataSourceWithDio().removeCommonQuestion(
          removeCommonQuestions,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalUserCommonQuestionEntity>>
  getUserCommonQuestions(String token) async {
    try {
      return right(
        await GetUserCommonQuestionDataSourceWithDio().getUserQuestions(token),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> removeUserQuestion(
    RemoveCommonQuestionEntity removeCommonQuestions,
  ) async {
    try {
      return right(
        await RemoveUserCommonQuestionDataSourceWithDio().removeUserQuestion(
          removeCommonQuestions,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> updateUserQuestion(
    UpdateUserQuestionEntity updateUserCommonQuestionEntity,
  ) async {
    try {
      return right(
        await UpdateUserCommonQuestionDataSrouceWithDio()
            .updateUserCommonQuestion(updateUserCommonQuestionEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalCommonQuestionsEntity>>
  reGetCommonQuestions(String link) async {
    try {
      return right(
        await ReGetCommonQuestionDataSourceWithDio().reGetCommonQuestions(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalUserCommonQuestionEntity>>
  reGetUserCommonQuestions(String link) async {
    try {
      return right(
        await ReGetUseCommonQuestionDataSourceWithDio()
            .reGetUserCommonQuestions(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
