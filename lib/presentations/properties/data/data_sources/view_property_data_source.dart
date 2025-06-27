import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class ViewPropertyDataSource {
  Future<ViewPropertyEntity> viewProperty(
    ViewPropertyRequestEntity viewPropertyRequestEntity,
  );
}

class ViewPropertyDataSourceWithDio extends ViewPropertyDataSource {
  ViewPropertyDataSourceWithDio? _viewPropertyDataSourceWithDio;
  ViewPropertyDataSourceWithDio get() =>
      _viewPropertyDataSourceWithDio ??
      (_viewPropertyDataSourceWithDio = ViewPropertyDataSourceWithDio());

  @override
  Future<ViewPropertyEntity> viewProperty(
    ViewPropertyRequestEntity viewPropertyRequestEntity,
  ) async {
    print(viewPropertyRequestEntity.id);
    String message = '';
    try {
      final infoResponse = await Apis().get(
        '${NetworkApisRouts().getPropertyInfoApi()}${viewPropertyRequestEntity.id}',
        {},
        '',
      );
      if (infoResponse['errors'] == null) {
        message = infoResponse['message'];
      } else {
        message = infoResponse['message'] ?? infoResponse['errors'];
        throw Exception();
      }

      final imagesResponse = await Apis().get(
        '${NetworkApisRouts().getPropertyImagesApi()}${viewPropertyRequestEntity.id}',
        {},
        '',
      );
      if (imagesResponse['errors'] == null) {
        message = imagesResponse['message'];
      } else {
        message = imagesResponse['message'] ?? imagesResponse['errors'];
        throw Exception();
      }
      final descriptionItem = infoResponse['data'];
      final imagesItem = imagesResponse['data']['Property_image'];
      final documentItem = imagesResponse['data']['Property_document'];
      final idsItem = imagesResponse['data']['id_images'];
      return ViewPropertyEntity(
        requestDescriptionInfoEntity: RequestDescriptionInfoEntity(
          userId: descriptionItem['user_id'],
          roomNumbers: descriptionItem['number_of_rooms'],
          bathroomNumbers: descriptionItem['number_of_bathrooms'],
          propertyAge: descriptionItem['property_age'],
          overlook: descriptionItem['overlook_from'],
          legalCheck: descriptionItem['legal_check'],
          exactPosition: descriptionItem['exact_position'],
          paintingType: descriptionItem['painting_type'],
          areaSize: descriptionItem['area'],
          decoration: descriptionItem['decoration'],
          kitchenType: descriptionItem['kitchen_type'],
          flooringType: descriptionItem['flooring_type'],
          balconySize: descriptionItem['balcony_size'],
          price: descriptionItem['price'],
          payWay: descriptionItem['pay_way'],
          state: descriptionItem['state'],
          expertCheck: descriptionItem['expert_check'],
          contract: descriptionItem['contract'],
          propertyType: descriptionItem['property_type'],
          status: descriptionItem['status'],
        ),
        requestImagesInfoEntity: RequestImagesInfoEntity(
          images: getImages(imagesItem),
          documents: getImages(documentItem),
          ids: getImages(idsItem),
        ),
      );
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      print(error);
      throw ServerAdminError(message: message);
    }
  }
}

List<String> getImages(List<dynamic> list) {
  List<String> images = [];
  for (Map<String, dynamic> item in list) {
    images.add(item['path']);
  }
  return images;
}
