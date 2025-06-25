import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class SetPropertySoldDataSrouce {
  Future<String> setPropertySold(PropertyDesicionEntity propertyDesicionEntity);
}

class SetPropertySoldDataSrouceWithDio extends SetPropertySoldDataSrouce {
  SetPropertySoldDataSrouceWithDio? _setPropertySoldDataSrouceWithDio;
  SetPropertySoldDataSrouceWithDio get() =>
      _setPropertySoldDataSrouceWithDio ??
      (_setPropertySoldDataSrouceWithDio = SetPropertySoldDataSrouceWithDio());

  @override
  Future<String> setPropertySold(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    String message = '';
    print(propertyDesicionEntity.id);

    try {
      final response = await Apis().post(
        '${NetworkApisRouts().setPropertySoldApi()}${propertyDesicionEntity.id}',
        FormData.fromMap({}),
        propertyDesicionEntity.token,
      );
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      print(message);

      return message;
    } catch (error) {
      print(error);

      throw ServerAdminError(message: message);
    }
  }
}
