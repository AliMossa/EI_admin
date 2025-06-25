import 'package:admin_dashboard/presentations/users/domain/entities/get_user_info_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

abstract class GetUserInfoDataSource {
  Future<UserEntity> getUserInfo(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  );
}

class GetUserInfoDataSourceWithDio extends GetUserInfoDataSource {
  GetUserInfoDataSourceWithDio? _getUserInfoDataSourceWithDio;
  GetUserInfoDataSourceWithDio get() =>
      _getUserInfoDataSourceWithDio ??
      (_getUserInfoDataSourceWithDio = GetUserInfoDataSourceWithDio());

  @override
  Future<UserEntity> getUserInfo(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  ) async {
    try {
      final response = await Apis().get(
        '${NetworkApisRouts().viewEmployeeApi()}${getUserInfoRequestEntity.id}',
        {},
        getUserInfoRequestEntity.token,
      );
      Map<String, dynamic> item = response['data'];
      print(item);
      return UserEntity(
        id: item['id'],
        fullName: item['name'],
        email: item['email'],
        phone: item['phone'],
        loggedIn: '',
        isActive: item['active'] == 1 ? true : false,
      );
    } catch (error) {
      print(error);
      throw ServerAdminError(message: 'message');
    }
  }
}
