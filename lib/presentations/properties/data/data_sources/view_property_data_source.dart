import 'dart:developer';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/documents_images_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

abstract class ViewPropertyDataSource {
  Future<ViewPropertyEntity> viewProperty(
    ViewPropertyRequestEntity viewPropertyRequestEntity,
  );
}

class ViewPropertyDataSourceWithDio extends ViewPropertyDataSource {
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
        aggreement:
            aggrementItem['agreement']?['Text_of_the_agreement'] ?? null,
        requestDescriptionInfoEntity: RequestDescriptionInfoEntity(
          userId: descriptionItem['user_id'],
          roomNumbers: descriptionItem['number_of_rooms'],
          bathroomNumbers: descriptionItem['number_of_bathrooms'],
          propertyAge: descriptionItem['property_age'],
          overlook: descriptionItem['overlook_from'],
          legalCheck: descriptionItem['legal_check'],
          exactPosition: descriptionItem['exact_position'],
          paintingType: descriptionItem['painting_type'],
          areaSize: NumberFormat.decimalPattern().format(
            double.parse(descriptionItem['area']),
          ),
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
          expectedPrice: NumberFormat.decimalPattern().format(
            economicItem['expected_price'],
          ),
          buyingPrice: NumberFormat.decimalPattern().format(
            economicItem['buying_price'],
          ),
          totalExpectedTaxes: NumberFormat.decimalPattern().format(
            economicItem['total_expected_taxes'],
          ),
          rentingPrice: NumberFormat.decimalPattern().format(
            economicItem['renting_price'],
          ),
          chancePrice: NumberFormat.decimalPattern().format(
            economicItem['chance_price'],
          ),
          investmentTime: economicItem['investment_time'],
          incommingTime: economicItem['incoming_time'],
          investmentMode: economicItem['investment_mode'],
          propertyManagement: economicItem['property_management'],
          agreedNegotiation: economicItem['agreed_negotiation'],
        ),
        documentsImagesEntity: DocumentsImagesEntity(
          images: [documentsItem['front_image'], documentsItem['back_image']],
        ),
      );
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'ViewProperty');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'ViewProperty');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ViewProperty',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
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
