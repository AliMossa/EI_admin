import 'package:admin_dashboard/presentations/search/domain/entities/search_request_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_result_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class SearchDataSource {
  Future<SearchTotalEntity> search(SearchRequestEntity searchRequestEntity);
}

class SearchDataSourceWithDio extends SearchDataSource {
  SearchDataSourceWithDio? _searchDataSourceWithDio;
  SearchDataSourceWithDio get() =>
      _searchDataSourceWithDio ??
      (_searchDataSourceWithDio = SearchDataSourceWithDio());

  @override
  Future<SearchTotalEntity> search(
    SearchRequestEntity searchRequestEntity,
  ) async {
    String message = '';
    List<SearchResultEntity> list = [];
    try {
      final response = await Apis().post(
        NetworkApisRouts().searchApi(),
        FormData.fromMap({
          'name': searchRequestEntity.searchEntity.name,
          if (searchRequestEntity.searchEntity.fatherName != null)
            'father_name': searchRequestEntity.searchEntity.fatherName,
          if (searchRequestEntity.searchEntity.motherName != null)
            'mother_name': searchRequestEntity.searchEntity.motherName,
          'role_id': searchRequestEntity.searchEntity.roleId,
        }),
        searchRequestEntity.token,
      );
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
      return SearchTotalEntity(link: '', list: list);
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
