import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/repositories/property_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetSoldPropertiesUseCase {
  PropertyRepository propertyRepository;
  ReGetSoldPropertiesUseCase({required this.propertyRepository});
  Future<Either<AdminExceptions, PropertyListEntity>> call(String link) async {
    return await propertyRepository.reGetSoldProperties(link);
  }
}
