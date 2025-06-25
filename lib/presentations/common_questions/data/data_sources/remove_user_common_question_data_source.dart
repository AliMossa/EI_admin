import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class RemoveUserCommonQuestionDataSource {
  Future<String> removeUserQuestion(
    RemoveCommonQuestionEntity removeAdminCommonQuestions,
  );
}

class RemoveUserCommonQuestionDataSourceWithDio
    extends RemoveUserCommonQuestionDataSource {
  RemoveUserCommonQuestionDataSourceWithDio? _commonQuestionDataSourceWithDio;

  RemoveUserCommonQuestionDataSourceWithDio get() =>
      _commonQuestionDataSourceWithDio ??
      (_commonQuestionDataSourceWithDio =
          RemoveUserCommonQuestionDataSourceWithDio());

  @override
  Future<String> removeUserQuestion(
    RemoveCommonQuestionEntity removeCommonQuestions,
  ) async {
    String message = '';
    try {
      final response = await Apis().delet(
        '${NetworkApisRouts().removeUserQuestionApi()}${removeCommonQuestions.id}',
        {},
        removeCommonQuestions.token,
      );

      // if (response['errors'] == null) {
      //   message = response['message'];
      // } else {
      //   message = response['message'] ?? response['errors'];
      //   throw Exception();
      // }
      return message;
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
