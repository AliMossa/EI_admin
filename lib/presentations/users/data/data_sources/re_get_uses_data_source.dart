import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

abstract class ReGetUsesDataSource {
  Future<TotalUserEntity> reGetUsers(String link);
}

class ReGetUsesDataSourceWithDio extends ReGetUsesDataSource {
  ReGetUsesDataSourceWithDio? _reGetUsesDataSourceWithDio;
  ReGetUsesDataSourceWithDio get() =>
      _reGetUsesDataSourceWithDio ??
      (_reGetUsesDataSourceWithDio = ReGetUsesDataSourceWithDio());
  @override
  Future<TotalUserEntity> reGetUsers(String link) async {
    String message = '';
    List<UserEntity> list = [];

    try {
      final response = await Apis().get(link, {}, '');
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']) {
        list.add(
          UserEntity(
            id: item['id'],
            fullName: item['name'],
            email: item['email'],
            phone: item['phone'],
            loggedIn: DateFormat().add_yMEd().add_jms().format(
              DateTime.parse(item['created_at']),
            ),
          ),
        );
      }
      return TotalUserEntity(users: list, nextPage: '');
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
