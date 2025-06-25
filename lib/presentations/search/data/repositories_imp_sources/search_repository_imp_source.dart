import 'package:admin_dashboard/presentations/search/data/data_sources/re_get_search_data_source.dart';
import 'package:admin_dashboard/presentations/search/data/data_sources/search_data_source.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_request_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_result_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/repositories/search_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class SearchRepositoryImpSource implements SearchRepository {
  @override
  Future<Either<AdminExceptions, SearchTotalEntity>> search(
    SearchRequestEntity searchRequestEntity,
  ) async {
    try {
      return right(
        await SearchDataSourceWithDio().get().search(searchRequestEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, SearchTotalEntity>> reGetSearch(
    String link,
  ) async {
    try {
      return right(
        await ReGetSearchDataSourceWithDio().get().reGetSearch(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
