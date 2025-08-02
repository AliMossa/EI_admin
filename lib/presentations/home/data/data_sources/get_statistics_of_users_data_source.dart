import 'dart:developer';

import 'package:admin_dashboard/presentations/home/domain/entities/request_statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetStatisticsOfUsersDataSource {
  Future<StatisticsOfUsersEntity> getStatisticsOfUsers(
    RequestStatisticsOfUsersEntity requestStatisticsOfUsersEntity,
  );
}

class GetStatisticsOfUsersDataSourceWithDio
    extends GetStatisticsOfUsersDataSource {
  @override
  Future<StatisticsOfUsersEntity> getStatisticsOfUsers(
    RequestStatisticsOfUsersEntity requestStatisticsOfUsersEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getStatisticsOfUsersApi(),
        {},
        requestStatisticsOfUsersEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      final item = response['data'];
      return StatisticsOfUsersEntity(
        admins: item['admin'],
        investors: item['investor'],
        economicTeams: item['economic team'],
        legalTeams: item['legal team'],
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetStatisticsOfUsers');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetStatisticsOfUsers');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetCommonQueGetStatisticsOfUsersstions',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
