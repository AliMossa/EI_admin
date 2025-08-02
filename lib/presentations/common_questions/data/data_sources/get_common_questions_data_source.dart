import 'dart:developer';

import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class GetCommonQuestionsDataSource {
  Future<TotalCommonQuestionsEntity> getCommonQuestions();
}

class GetCommonQuestionsDataSourceWithDio extends GetCommonQuestionsDataSource {
  @override
  Future<TotalCommonQuestionsEntity> getCommonQuestions() async {
    final dateFormat = DateFormat().add_yMEd().add_jms();
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getAdminCommonQuestionsApi(),
        {},
        '',
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      final List<CommonQuestionsEntity> questions =
          (response['data'] as List)
              .map(
                (item) => CommonQuestionsEntity(
                  id: item['id'],
                  question: item['question'],
                  answer: item['Answer'],
                  createDate: dateFormat.format(
                    DateTime.parse(item['created_at']),
                  ),
                  updateDate: dateFormat.format(
                    DateTime.parse(item['updated_at']),
                  ),
                ),
              )
              .toList();

      return TotalCommonQuestionsEntity(
        list: questions,
        nextPage: '', // Optional: Add pagination logic here
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetCommonQuestions');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetCommonQuestions');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetCommonQuestions',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
