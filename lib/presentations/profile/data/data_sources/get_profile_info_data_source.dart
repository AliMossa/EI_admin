import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

abstract class GetProfileInfoDataSource {
  Future<ProfileEntity> getProfileInfo(String token);
}

class GetProfileInfoDataSourceWithDio extends GetProfileInfoDataSource {
  GetProfileInfoDataSourceWithDio? _getProfileInfoDataSourceWithDio;
  GetProfileInfoDataSourceWithDio get() =>
      _getProfileInfoDataSourceWithDio ??
      (_getProfileInfoDataSourceWithDio = GetProfileInfoDataSourceWithDio());

  @override
  Future<ProfileEntity> getProfileInfo(String token) async {
    String message = '';
    try {
      final response = await Apis().get(
        NetworkApisRouts().getProfileInfoApi(),
        {},
        token,
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      print(response['data']);
      return ProfileEntity(
        id: response['data']['id'],
        roleId: response['data']['role_id'],
        name: response['data']['name'],
        email: response['data']['email'],
        phone: response['data']['phone'],
        joindedDate: DateFormat(
          'MMMM d, y',
        ).format(DateTime.parse(response['data']['created_at'])),
        pesonalPhoto: response['data']['personal_photo'] ?? '',
      );
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
