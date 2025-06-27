import 'package:admin_dashboard/presentations/common_questions/domain/entities/update_user_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class UpdateUserCommonQuestionDataSrouce {
  Future<String> updateUserCommonQuestion(
    UpdateUserQuestionEntity updateUserCommonQuestionEntity,
  );
}

class UpdateUserCommonQuestionDataSrouceWithDio
    extends UpdateUserCommonQuestionDataSrouce {
  UpdateUserCommonQuestionDataSrouceWithDio?
  _updateUserCommonQuestionDataSrouceWithDio;
  UpdateUserCommonQuestionDataSrouceWithDio get() =>
      _updateUserCommonQuestionDataSrouceWithDio ??
      (_updateUserCommonQuestionDataSrouceWithDio =
          UpdateUserCommonQuestionDataSrouceWithDio());
  @override
  Future<String> updateUserCommonQuestion(
    UpdateUserQuestionEntity updateUserCommonQuestionEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().answerUserQuestionApi()}${updateUserCommonQuestionEntity.id}',
        FormData.fromMap({'Answer': updateUserCommonQuestionEntity.answer}),
        updateUserCommonQuestionEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
