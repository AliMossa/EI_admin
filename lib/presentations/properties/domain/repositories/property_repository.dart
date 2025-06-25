import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class PropertyRepository {
  Future<Either<AdminExceptions, PropertyListEntity>> getProperties(
    String token,
  );
  Future<Either<AdminExceptions, PropertyListEntity>> getSoldProperties(
    String token,
  );
  Future<Either<AdminExceptions, PropertyListEntity>> reGetProperties(
    String link,
  );
  Future<Either<AdminExceptions, PropertyListEntity>> reGetSoldProperties(
    String link,
  );
  Future<Either<ServerAdminException, ViewPropertyEntity>> viewProperty(
    ViewPropertyRequestEntity viewPropertyRequestEntity,
  );
  Future<Either<ServerAdminException, String>> setPropertySold(
    PropertyDesicionEntity propertyDesicionEntity,
  );
  Future<Either<ServerAdminException, String>> newPropertyStudy(
    PropertyDesicionEntity propertyDesicionEntity,
  );
}
