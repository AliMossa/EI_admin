import 'dart:developer';

import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ReGetUseCommonQuestionDataSource {
  Future<TotalUserCommonQuestionEntity> reGetUserCommonQuestions(String link);
}

class ReGetUseCommonQuestionDataSourceWithDio
    extends ReGetUseCommonQuestionDataSource {
  @override
  Future<TotalUserCommonQuestionEntity> reGetUserCommonQuestions(
    String link,
  ) async {
    String message = '';
    List<UserCommonQuestionEntity> list = [];

    try {
      final response = await Apis().get(link, {}, '');
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']) {
        list.add(
          UserCommonQuestionEntity(
            id: item['id'],
            userName: item['user_name'],
            question: item['question'],
            answer: item['Answer'],
            createDate: item['created_at'],
          ),
        );
      }
      return TotalUserCommonQuestionEntity(questions: list, nextPage: '');
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ReGetUseCommonQuestion');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ReGetUseCommonQuestion');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ReGetUseCommonQuestion',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
