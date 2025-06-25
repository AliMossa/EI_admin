import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:dio/dio.dart';

abstract class PropertyNewStudyDataSource {
  Future<String> newPropertyStudy(
    PropertyDesicionEntity propertyDesicionEntity,
  );
}

class PropertyNewStudyDataSourceWithDio extends PropertyNewStudyDataSource {
  PropertyNewStudyDataSourceWithDio? _setPropertySoldDataSrouceWithDio;
  PropertyNewStudyDataSourceWithDio get() =>
      _setPropertySoldDataSrouceWithDio ??
      (_setPropertySoldDataSrouceWithDio = PropertyNewStudyDataSourceWithDio());

  @override
  Future<String> newPropertyStudy(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().post(
        '${NetworkApisRouts().propertyNewStudyApi()}${propertyDesicionEntity.id}',
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
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}
