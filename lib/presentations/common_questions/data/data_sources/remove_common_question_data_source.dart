import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class RemoveCommonQuestionDataSource {
  Future<String> removeCommonQuestion(
    RemoveCommonQuestionEntity removeAdminCommonQuestions,
  );
}

class RemoveCommonQuestionDataSourceWithDio
    extends RemoveCommonQuestionDataSource {
  RemoveCommonQuestionDataSourceWithDio? _removeCommonQuestionDataSourceWithDio;
  RemoveCommonQuestionDataSourceWithDio get() =>
      _removeCommonQuestionDataSourceWithDio ??
      (_removeCommonQuestionDataSourceWithDio =
          RemoveCommonQuestionDataSourceWithDio());
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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
