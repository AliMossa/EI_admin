import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<ServerAdminException, ListSuccessStatisticsEntity>>
  getSuccessStatistics(
    RequestSuccessStatisticsEntity requestSuccessStatisticsEntity,
  );
  Future<Either<ServerAdminException, StatisticsOfUsersEntity>>
  getStatisticsOfUsers(
    RequestStatisticsOfUsersEntity requestStatisticsOfUsersEntity,
  );
  Future<Either<ServerAdminException, RequestsStatisticsEntity>>
  getRequestsStatistics(
    RequestRequestsStatisticsEntity requestRequestsStatisticsEntity,
  );

  Future<Either<ServerAdminException, MoniesRatesEntity>> getMoniesRates();
}
