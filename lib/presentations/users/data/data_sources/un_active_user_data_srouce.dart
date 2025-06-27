import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class UnActiveUserDataSrouce {
  Future<String> unActivateUser(ActivateUserEntity activateUser);
}

class UnActiveUserDataSrouceWithDio extends UnActiveUserDataSrouce {
  UnActiveUserDataSrouceWithDio? _unActiveUserDataSrouceWithDio;
  UnActiveUserDataSrouceWithDio get() =>
      _unActiveUserDataSrouceWithDio ??
      (_unActiveUserDataSrouceWithDio = UnActiveUserDataSrouceWithDio());

  @override
  Future<String> unActivateUser(ActivateUserEntity activateUserEntity) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().unActiveUserApi()}${activateUserEntity.id}',
        FormData.fromMap({}),
        activateUserEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
