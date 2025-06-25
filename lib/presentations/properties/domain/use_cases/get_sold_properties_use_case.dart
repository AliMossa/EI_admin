import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/repositories/property_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetSoldPropertiesUseCase {
  PropertyRepository propertyRepository;
  GetSoldPropertiesUseCase({required this.propertyRepository});

  Future<Either<AdminExceptions, PropertyListEntity>> call(String token) async {
    return await propertyRepository.getSoldProperties(token);
  }
}
