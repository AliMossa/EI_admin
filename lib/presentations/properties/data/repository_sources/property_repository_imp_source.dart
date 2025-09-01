import 'package:admin_dashboard/presentations/properties/data/data_sources/get_properties_data_srouce.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/get_sold_properties_data_source.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/get_viewed_properties_data_source.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/property_new_study_data_source.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/re_get_properties_data_rouce.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/re_get_sold_properties_data_source.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/set_property_sold_data_srouce.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/show_on_stage_data_source.dart';
import 'package:admin_dashboard/presentations/properties/data/data_sources/view_property_data_source.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/repositories/property_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class PropertyRepositoryImpSource implements PropertyRepository {
  @override
  Future<Either<AdminExceptions, PropertyListEntity>> getProperties(
    String token,
  ) async {
    try {
      return right(await GetPropertiesDataSrouceWithDio().getProperties(token));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, ViewPropertyEntity>> viewProperty(
    ViewPropertyRequestEntity viewPropertyRequestEntity,
  ) async {
    try {
      return right(
        await ViewPropertyDataSourceWithDio().viewProperty(
          viewPropertyRequestEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, PropertyListEntity>> reGetProperties(
    String link,
  ) async {
    try {
      return right(
        await ReGetPropertiesDataRouceWithDio().reGetProperties(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, String>> newPropertyStudy(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    try {
      return right(
        await PropertyNewStudyDataSourceWithDio().newPropertyStudy(
          propertyDesicionEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, String>> setPropertySold(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    try {
      return right(
        await SetPropertySoldDataSrouceWithDio().setPropertySold(
          propertyDesicionEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, PropertyListEntity>> getSoldProperties(
    String token,
  ) async {
    try {
      return right(
        await GetSoldPropertiesDataSourceWithDio().getSoldProperties(token),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, PropertyListEntity>> reGetSoldProperties(
    String link,
  ) async {
    try {
      return right(
        await ReGetSoldPropertiesDataSourceWithDio().reGetSoldProperties(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<ServerAdminException, String>> showOnStage(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    try {
      return right(
        await ShowOnStageDataSourceWithDio().showOnStage(
          propertyDesicionEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, PropertyListEntity>> getViewedProperties(
    String token,
  ) async {
    try {
      return right(
        await GetViewedPropertiesDataSourceWithDio().getViewedProperties(token),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
