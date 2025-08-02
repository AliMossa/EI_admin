import 'dart:developer';

import 'package:admin_dashboard/presentations/common_questions/domain/entities/add_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class AddCommonQuestionDataSource {
  Future<String> addCommonQuestion(
    AddCommonQuestionEntity addCommonQuestionEntity,
  );
}

class AddCommonQuestionDataSourceWithDio extends AddCommonQuestionDataSource {
  @override
  Future<String> addCommonQuestion(
    AddCommonQuestionEntity addCommonQuestionEntity,
  ) async {
    String message = '';

    try {
      final response = await Apis().post(
        NetworkApisRouts().addCommonQuestionApi(),
        FormData.fromMap({
          'question': addCommonQuestionEntity.question,
          'Answer': addCommonQuestionEntity.answer,
        }),
        addCommonQuestionEntity.token,
      );
      // if (response['errors'] == null) {
      //   message = response['message'];
      // } else {
      //   message = response['message'] ?? response['errors'];
      //   throw Exception();
      // }
      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'AddCommonQuestion');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'AddCommonQuestion');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'AddCommonQuestion',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
