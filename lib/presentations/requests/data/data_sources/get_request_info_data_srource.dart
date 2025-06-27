import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/send_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class GetRequestInfoDataSrource {
  Future<RequestInfoEntity> getRequestInfo(SendRequestEntity sendRequestEntity);
}

class GetRequestInfoDataSrourceWithDio extends GetRequestInfoDataSrource {
  GetRequestInfoDataSrourceWithDio? _getRequestInfoDataSrourceWithDio;
  GetRequestInfoDataSrourceWithDio get() =>
      _getRequestInfoDataSrourceWithDio ??
      (_getRequestInfoDataSrourceWithDio = GetRequestInfoDataSrourceWithDio());

  @override
  Future<RequestInfoEntity> getRequestInfo(
    SendRequestEntity sendRequestEntity,
  ) async {
    String message = '';
    try {
      final response = await Apis().get(
        '${NetworkApisRouts().getRequestInfoApi()}${sendRequestEntity.id}',
        {},
        sendRequestEntity.token,
      );
      final item = response['data'];
      final economicItem = item['economic_evaluation'];
      final descriptionItem = economicItem['property'];
      final imagesItem = descriptionItem['images'];
      final documentItem = descriptionItem['documents'];
      final idsItem = descriptionItem['id_images'];
      return RequestInfoEntity(
        id: item['id'],
        adminNote: item['note_admin'],
        creatingDate: item['created_at'],
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
        requestImagesInfoEntity: RequestImagesInfoEntity(
          images: getImages(imagesItem),
          documents: getImages(documentItem),
          ids: getImages(idsItem),
        ),
        requestStatus: item['status'],
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
