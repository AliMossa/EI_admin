import 'package:admin_dashboard/presentations/properties/domain/entities/property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class ReGetSoldPropertiesDataSource {
  Future<PropertyListEntity> reGetSoldProperties(String link);
}

class ReGetSoldPropertiesDataSourceWithDio
    extends ReGetSoldPropertiesDataSource {
  ReGetSoldPropertiesDataSourceWithDio? _reGetSoldPropertiesDataSourceWithDio;
  ReGetSoldPropertiesDataSourceWithDio get() =>
      _reGetSoldPropertiesDataSourceWithDio ??
      (_reGetSoldPropertiesDataSourceWithDio =
          ReGetSoldPropertiesDataSourceWithDio());
  @override
  Future<PropertyListEntity> reGetSoldProperties(String link) async {
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
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
