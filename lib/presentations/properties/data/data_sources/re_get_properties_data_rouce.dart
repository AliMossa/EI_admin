import 'dart:developer';

import 'package:admin_dashboard/presentations/properties/domain/entities/property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class ReGetPropertiesDataRouce {
  Future<PropertyListEntity> reGetProperties(String link);
}

class ReGetPropertiesDataRouceWithDio extends ReGetPropertiesDataRouce {
  @override
  Future<PropertyListEntity> reGetProperties(String link) async {
    String message = '';
    List<PropertyRequestEntity> list = [];

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
          PropertyRequestEntity(
            id: item['id'],
            location: item['location'],
            propertyType: item['property_type'],
          ),
        );
      }
      return PropertyListEntity(list: list, nextPage: '');
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ReGetProperties');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ReGetProperties');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ReGetProperties',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
