import 'dart:developer';

import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class RemoveCommonQuestionDataSource {
  Future<String> removeCommonQuestion(
    RemoveCommonQuestionEntity removeAdminCommonQuestions,
  );
}

class RemoveCommonQuestionDataSourceWithDio
    extends RemoveCommonQuestionDataSource {
  @override
  Future<String> removeCommonQuestion(
    RemoveCommonQuestionEntity removeCommonQuestion,
  ) async {
    String message = '';

    try {
      final response = await Apis().delet(
        '${NetworkApisRouts().removeCommonQuestionApi()}${removeCommonQuestion.id}',
        {},
        removeCommonQuestion.token,
      );

      // if (response['errors'] == null) {
      //   message = response['message'];
      // } else {
      //   message = response['message'] ?? response['errors'];
      //   throw Exception();
      // }
      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'RemoveCommonQuestion');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log(
        'DioException: ${dioError.message}',
        name: 'GetComRemoveCommonQuestionmonQuestions',
      );
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'RemoveCommonQuestion',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
