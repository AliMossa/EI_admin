import 'package:admin_dashboard/presentations/home/domain/entities/request_statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/repositories/home_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetStatisticsOfUsesUseCase {
  HomeRepository homeRepository;
  GetStatisticsOfUsesUseCase({required this.homeRepository});

  Future<Either<ServerAdminException, StatisticsOfUsersEntity>> call(
    RequestStatisticsOfUsersEntity requestStatisticsOfUsersEntity,
  ) async {
    return await homeRepository.getStatisticsOfUsers(
      requestStatisticsOfUsersEntity,
    );
  }
}
