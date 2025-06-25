import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/repositories/home_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetSuccessStatisticsUseCase {
  HomeRepository homeRepository;
  GetSuccessStatisticsUseCase({required this.homeRepository});
  Future<Either<ServerAdminException, ListSuccessStatisticsEntity>> call(
    RequestSuccessStatisticsEntity requestSuccessStatisticsEntity,
  ) async {
    return await homeRepository.getSuccessStatistics(
      requestSuccessStatisticsEntity,
    );
  }
}
