import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

abstract class ReGetCommonQuestionDataSource {
  Future<TotalCommonQuestionsEntity> reGetCommonQuestions(String link);
}

class ReGetCommonQuestionDataSourceWithDio
    extends ReGetCommonQuestionDataSource {
  ReGetCommonQuestionDataSourceWithDio? _reGetCommonQuestionDataSourceWithDio;
  ReGetCommonQuestionDataSourceWithDio get() =>
      _reGetCommonQuestionDataSourceWithDio ??
      (_reGetCommonQuestionDataSourceWithDio =
          ReGetCommonQuestionDataSourceWithDio());

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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
