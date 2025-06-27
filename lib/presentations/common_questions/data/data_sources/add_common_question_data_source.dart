import 'package:admin_dashboard/presentations/common_questions/domain/entities/add_common_question_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class AddCommonQuestionDataSource {
  Future<String> addCommonQuestion(
    AddCommonQuestionEntity addCommonQuestionEntity,
  );
}

class AddCommonQuestionDataSourceWithDio extends AddCommonQuestionDataSource {
  AddCommonQuestionDataSourceWithDio? _addCommonQuestionDataSourceWithDio;
  AddCommonQuestionDataSourceWithDio get() =>
      _addCommonQuestionDataSourceWithDio ??
      (_addCommonQuestionDataSourceWithDio =
          AddCommonQuestionDataSourceWithDio());

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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
