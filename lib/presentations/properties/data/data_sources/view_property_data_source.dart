import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/documents_images_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:intl/intl.dart';

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
      final economicResponse = await Apis().get(
        '${NetworkApisRouts().getEconomicEvaluationApi()}${viewPropertyRequestEntity.id}',
        {},
        viewPropertyRequestEntity.token,
      );
      if (economicResponse['errors'] == null) {
        message = economicResponse['message'];
      } else {
        message = economicResponse['message'] ?? economicResponse['errors'];
        throw Exception();
      }

      final descriptionItem = infoResponse['data'];
      final imagesItem = imagesResponse['data']['Property_image'];
      final documentItem = imagesResponse['data']['Property_document'];
      final idsItem = imagesResponse['data']['id_images'];
      final documentsItem = economicResponse['data']['Royal images'];
      final economicItem = economicResponse['data']['economic_evaluation'];
      final aggrementItem = economicResponse['data'];

      return ViewPropertyEntity(
        aggreement: aggrementItem['agreement'],
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
          price: NumberFormat.decimalPattern().format(
            double.parse(descriptionItem['price']),
          ),
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
        requestEconomicInfoEntity: RequestEconomicInfoEntity(
          numberOfChances: economicItem['number_of_chances'],
          profitPercent: economicItem['profit_percent'],
          expectedPrice: economicItem['expected_price'] * 1.0,
          buyingPrice: economicItem['buying_price'] * 1.0,
          totalExpectedTaxes: economicItem['total_expected_taxes'] * 1.0,
          rentingPrice: economicItem['renting_price'] * 1.0,
          chancePrice: economicItem['chance_price'] * 1.0,

          investmentTime: economicItem['investment_time'],
          incommingTime: economicItem['incoming_time'],
          investmentMode: economicItem['investment_mode'],
          propertyManagement: economicItem['property_management'],
          agreedNegotiation: economicItem['agreed_negotiation'],
        ),
        documentsImagesEntity: DocumentsImagesEntity(
          images: [documentsItem['front_image'], documentsItem['front_image']],
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
