import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/repositories/search_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetSerachUseCase {
  SearchRepository searchRepository;
  ReGetSerachUseCase({required this.searchRepository});

  Future<Either<AdminExceptions, SearchTotalEntity>> call(String link) async {
    return await searchRepository.reGetSearch(link);
  }
}
