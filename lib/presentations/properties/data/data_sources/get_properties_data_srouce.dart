import 'dart:developer';

import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetPropertiesDataSrouce {
  Future<PropertyListEntity> getProperties(String token);
}

class GetPropertiesDataSrouceWithDio extends GetPropertiesDataSrouce {
  @override
  Future<PropertyListEntity> getProperties(String token) async {
    String message = '';
    List<PropertyRequestEntity> list = [];
    try {
      final response = await Apis().get(
        NetworkApisRouts().getOwnedPropertiesApi(),
        {},
        token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      print(response);
      for (Map<String, dynamic> item in response['data']['properties']) {
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
      log('ClientAdminError: ${error.message}', name: 'GetProperties');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetProperties');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetProperties',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
