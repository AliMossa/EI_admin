import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class AcceptRequestDataSource {
  Future<String> acceptRequest(RequestManagmentEntity requestManagmentEntity);
}

class AcceptRequestDataSourceWithDio extends AcceptRequestDataSource {
  AcceptRequestDataSourceWithDio? _acceptRequestDataSourceWithDio;
  AcceptRequestDataSourceWithDio get() =>
      _acceptRequestDataSourceWithDio ??
      (_acceptRequestDataSourceWithDio = AcceptRequestDataSourceWithDio());
  @override
  Future<String> acceptRequest(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().acceptPropertyRequestApi()}${requestManagmentEntity.id}',
        FormData.fromMap({}),
        requestManagmentEntity.token,
      );

      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      return message;
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
