import 'dart:developer';

import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ShowOnStageDataSource {
  Future<String> showOnStage(PropertyDesicionEntity propertyDesicionEntity);
}

class ShowOnStageDataSourceWithDio extends ShowOnStageDataSource {
  @override
  Future<String> showOnStage(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    String message = '';

    try {
      final response = await Apis().post(
        '${NetworkApisRouts().showPropertyOnStageApi()}${propertyDesicionEntity.id}',
        FormData.fromMap({}),
        propertyDesicionEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }

      return message;
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'SetPropertySold');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'SetPropertySold');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'SetPropertySold',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
