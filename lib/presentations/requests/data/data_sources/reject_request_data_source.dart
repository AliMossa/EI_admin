import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class RejectRequestDataSource {
  Future<String> rejectRequest(RequestManagmentEntity requestManagmentEntity);
}

class RejectRequestDataSourceWithDio extends RejectRequestDataSource {
  RejectRequestDataSourceWithDio? _acceptRequestDataSourceWithDio;
  RejectRequestDataSourceWithDio get() =>
      _acceptRequestDataSourceWithDio ??
      (_acceptRequestDataSourceWithDio = RejectRequestDataSourceWithDio());
  @override
  Future<String> rejectRequest(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    String message = '';
    try {
      print(requestManagmentEntity.notice);
      final response = await Apis().post(
        '${NetworkApisRouts().rejextPropertyRequestApi()}${requestManagmentEntity.id}',
        FormData.fromMap({'note_admin': requestManagmentEntity.notice}),
        requestManagmentEntity.token,
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
