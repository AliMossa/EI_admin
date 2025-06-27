import 'package:admin_dashboard/presentations/home/domain/entities/request_statistics_of_users_entity.dart';
import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class GetStatisticsOfUsersDataSource {
  Future<StatisticsOfUsersEntity> getStatisticsOfUsers(
    RequestStatisticsOfUsersEntity requestStatisticsOfUsersEntity,
  );
}

class GetStatisticsOfUsersDataSourceWithDio
    extends GetStatisticsOfUsersDataSource {
  GetStatisticsOfUsersDataSourceWithDio? _getStatisticsOfUsersDataSourceWithDio;
  GetStatisticsOfUsersDataSourceWithDio get() =>
      _getStatisticsOfUsersDataSourceWithDio ??
      (_getStatisticsOfUsersDataSourceWithDio =
          GetStatisticsOfUsersDataSourceWithDio());

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
      print(item);
      return StatisticsOfUsersEntity(
        admins: item['admin'],
        investors: item['investor'],
        economicTeams: item['economic team'],
        legalTeams: item['legal team'],
      );
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
