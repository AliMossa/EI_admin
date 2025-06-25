import 'package:admin_dashboard/presentations/properties/domain/entities/property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class ReGetPropertiesDataRouce {
  Future<PropertyListEntity> reGetProperties(String link);
}

class ReGetPropertiesDataRouceWithDio extends ReGetPropertiesDataRouce {
  ReGetPropertiesDataRouceWithDio? _reGetPropertiesDataRouceWithDio;
  ReGetPropertiesDataRouceWithDio get() =>
      _reGetPropertiesDataRouceWithDio ??
      (_reGetPropertiesDataRouceWithDio = ReGetPropertiesDataRouceWithDio());

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
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
