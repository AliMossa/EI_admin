import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class ReGetUseCommonQuestionDataSource {
  Future<TotalUserCommonQuestionEntity> reGetUserCommonQuestions(String link);
}

class ReGetUseCommonQuestionDataSourceWithDio
    extends ReGetUseCommonQuestionDataSource {
  ReGetUseCommonQuestionDataSourceWithDio?
  _reGetUseCommonQuestionDataSourceWithDio;
  ReGetUseCommonQuestionDataSourceWithDio get() =>
      _reGetUseCommonQuestionDataSourceWithDio ??
      (_reGetUseCommonQuestionDataSourceWithDio =
          ReGetUseCommonQuestionDataSourceWithDio());

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
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
