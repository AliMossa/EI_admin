import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/repositories/property_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetPropertiesUseCase {
  PropertyRepository propertyRepository;
  ReGetPropertiesUseCase({required this.propertyRepository});

  Future<Either<AdminExceptions, PropertyListEntity>> call(String link) async {
    return await propertyRepository.reGetProperties(link);
  }
}
