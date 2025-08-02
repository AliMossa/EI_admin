import 'package:admin_dashboard/presentations/home/data/data_sources/get_monies_rates_data_source.dart';
import 'package:admin_dashboard/presentations/home/data/data_sources/get_requests_statistics_data_source.dart';
import 'package:admin_dashboard/presentations/home/data/data_sources/get_statistics_of_users_data_source.dart';
import 'package:admin_dashboard/presentations/home/data/data_sources/get_success_statistics_data_source.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/list_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/monies_rates_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/request_success_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/requests_statistics_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/repositories/home_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpSource implements HomeRepository {
  @override
  Future<Either<ServerAdminException, ListSuccessStatisticsEntity>>
  getSuccessStatistics(
    RequestSuccessStatisticsEntity requestSuccessStatisticsEntity,
  ) async {
    try {
      return right(
        await GetSuccessStatisticsDataSourceWithDio().getSuccessStatistics(
          requestSuccessStatisticsEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, StatisticsOfUsersEntity>>
  getStatisticsOfUsers(
    RequestStatisticsOfUsersEntity requestStatisticsOfUsersEntity,
  ) async {
    try {
      return right(
        await GetStatisticsOfUsersDataSourceWithDio().getStatisticsOfUsers(
          requestStatisticsOfUsersEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, MoniesRatesEntity>>
  getMoniesRates() async {
    try {
      return right(await GetMoniesRatesDataSourceWithDio().getMoniesRates());
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, RequestsStatisticsEntity>>
  getRequestsStatistics(
    RequestRequestsStatisticsEntity requestRequestsStatisticsEntity,
  ) async {
    try {
      return right(
        await GetRequestsStatisticsDataSourceWithDio().getRequestsStatistics(
          requestRequestsStatisticsEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
