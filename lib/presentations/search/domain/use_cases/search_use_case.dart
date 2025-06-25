import 'package:admin_dashboard/presentations/search/domain/entities/search_request_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_result_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/repositories/search_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase {
  SearchRepository searchRepository;
  SearchUseCase({required this.searchRepository});
  Future<Either<AdminExceptions, SearchTotalEntity>> call(
    SearchRequestEntity searchRequestEntity,
  ) async {
    return await searchRepository.search(searchRequestEntity);
  }
}
