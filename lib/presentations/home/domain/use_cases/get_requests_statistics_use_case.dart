import 'package:admin_dashboard/presentations/home/domain/entities/request_requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/repositories/home_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetRequestsStatisticsUseCase {
  HomeRepository homeRepository;
  GetRequestsStatisticsUseCase({required this.homeRepository});
  Future<Either<ServerAdminException, RequestsStatisticsEntity>> call(
    RequestRequestsStatisticsEntity requestRequestsStatisticsEntity,
  ) async {
    return await homeRepository.getRequestsStatistics(
      requestRequestsStatisticsEntity,
    );
  }
}
