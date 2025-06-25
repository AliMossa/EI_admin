import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

abstract class GetCommonQuestionsDataSource {
  Future<TotalCommonQuestionsEntity> getCommonQuestions();
}

class GetCommonQuestionsDataSourceWithDio extends GetCommonQuestionsDataSource {
  GetCommonQuestionsDataSourceWithDio? _commonQuestionsDataSourceWithDio;
  GetCommonQuestionsDataSourceWithDio get() =>
      _commonQuestionsDataSourceWithDio ??
      (_commonQuestionsDataSourceWithDio =
          GetCommonQuestionsDataSourceWithDio());

  @override
  Future<TotalCommonQuestionsEntity> getCommonQuestions() async {
    List<CommonQuestionsEntity> list = [];
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
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
