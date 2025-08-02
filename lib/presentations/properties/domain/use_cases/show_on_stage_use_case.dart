import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/repositories/property_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ShowOnStageUseCase {
  PropertyRepository propertyRepository;
  ShowOnStageUseCase({required this.propertyRepository});
  Future<Either<ServerAdminException, String>> call(
    PropertyDesicionEntity propertyDesicionEntity,
  ) async {
    return await propertyRepository.showOnStage(propertyDesicionEntity);
  }
}
