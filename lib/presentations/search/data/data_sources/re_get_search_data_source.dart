import 'dart:developer';

import 'package:admin_dashboard/presentations/search/domain/entities/search_result_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class ReGetSearchDataSource {
  Future<SearchTotalEntity> reGetSearch(String link);
}

class ReGetSearchDataSourceWithDio extends ReGetSearchDataSource {
  @override
  Future<SearchTotalEntity> reGetSearch(String link) async {
    String message = '';
    List<SearchResultEntity> list = [];

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
          SearchResultEntity(
            id: item['id'],
            roleId: item['role_id'],
            name: item['name'],
            email: item['email'],
            phone: item['phone'],
            joinedDate: DateFormat(
              'MMMM d, y',
            ).format(DateTime.parse(item['created_at'])),
          ),
        );
      }
      return SearchTotalEntity(list: list, link: '');
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ReGetSearch');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ReGetSearch');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetCommonQuesReGetSearchtions',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
