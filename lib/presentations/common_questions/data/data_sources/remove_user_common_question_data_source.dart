import 'dart:developer';

import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class RemoveUserCommonQuestionDataSource {
  Future<String> removeUserQuestion(
    RemoveCommonQuestionEntity removeAdminCommonQuestions,
  );
}

class RemoveUserCommonQuestionDataSourceWithDio
    extends RemoveUserCommonQuestionDataSource {
  @override
  Future<String> removeUserQuestion(
    RemoveCommonQuestionEntity removeCommonQuestions,
  ) async {
    String message = '';
    try {
      final response = await Apis().delet(
        '${NetworkApisRouts().removeUserQuestionApi()}${removeCommonQuestions.id}',
        {},
        '',
      );
      print(response);
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      log(
        'ClientAdminError: ${error.message}',
        name: 'RemoveUserCommonQuestion',
      );
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log(
        'DioException: ${dioError.message}',
        name: 'RemoveUserCommonQuestion',
      );
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'RemoveUserCommonQuestion',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
