import 'dart:developer';

import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class ReGetCommonQuestionDataSource {
  Future<TotalCommonQuestionsEntity> reGetCommonQuestions(String link);
}

class ReGetCommonQuestionDataSourceWithDio
    extends ReGetCommonQuestionDataSource {
  @override
  Future<TotalCommonQuestionsEntity> reGetCommonQuestions(String link) async {
    String message = '';
    List<CommonQuestionsEntity> list = [];
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
          CommonQuestionsEntity(
            id: item['id'],
            question: item['question'],
            answer: item['Answer'],
            createDate: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['created_at']),
            ),
            updateDate: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['updated_at']),
            ),
          ),
        );
      }
      return TotalCommonQuestionsEntity(list: list, nextPage: '');
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ReGetCommonQuestion');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ReGetCommonQuestion');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ReGetCommonQuestion',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
