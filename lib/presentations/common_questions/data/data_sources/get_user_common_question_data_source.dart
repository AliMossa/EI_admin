import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class GetUserCommonQuestionDataSource {
  Future<TotalUserCommonQuestionEntity> getUserQuestions(String token);
}

class GetUserCommonQuestionDataSourceWithDio
    extends GetUserCommonQuestionDataSource {
  GetUserCommonQuestionDataSourceWithDio? _commonQuestionDataSourceWithDio;
  GetUserCommonQuestionDataSourceWithDio get() =>
      _commonQuestionDataSourceWithDio ??
      (_commonQuestionDataSourceWithDio =
          GetUserCommonQuestionDataSourceWithDio());

  @override
  Future<TotalUserCommonQuestionEntity> getUserQuestions(String token) async {
    String message = '';
    List<UserCommonQuestionEntity> list = [];
    try {
      final response = await Apis().get(
        NetworkApisRouts().getUserCommonQuestionsApi(),
        {},
        token,
      );

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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: '');
    }
  }
}
