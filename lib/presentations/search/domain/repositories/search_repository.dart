import 'package:admin_dashboard/presentations/search/domain/entities/search_request_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<AdminExceptions, SearchTotalEntity>> search(
    SearchRequestEntity searchRequestEntity,
  );
  Future<Either<AdminExceptions, SearchTotalEntity>> reGetSearch(String link);
}
