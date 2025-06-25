import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/repositories/property_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ViewPropertyUseCase {
  PropertyRepository propertyRepository;
  ViewPropertyUseCase({required this.propertyRepository});
  Future<Either<ServerAdminException, ViewPropertyEntity>> call(
    ViewPropertyRequestEntity viewPropertyRequestEntity,
  ) async {
    return await propertyRepository.viewProperty(viewPropertyRequestEntity);
  }
}
