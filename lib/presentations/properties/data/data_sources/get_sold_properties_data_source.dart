import 'package:admin_dashboard/presentations/properties/domain/entities/property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class GetSoldPropertiesDataSource {
  Future<PropertyListEntity> getSoldProperties(String token);
}

class GetSoldPropertiesDataSourceWithDio extends GetSoldPropertiesDataSource {
  GetSoldPropertiesDataSourceWithDio? _getSoldPropertiesDataSourceWithDio;
  GetSoldPropertiesDataSourceWithDio get() =>
      _getSoldPropertiesDataSourceWithDio ??
      (_getSoldPropertiesDataSourceWithDio =
          GetSoldPropertiesDataSourceWithDio());

  @override
  Future<PropertyListEntity> getSoldProperties(String token) async {
    String message = '';
    List<PropertyRequestEntity> list = [];

    try {
      final response = await Apis().get(
        NetworkApisRouts().getSoldPropertiesApi(),
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
        print(item);
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
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
