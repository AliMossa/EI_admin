import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/repositories/profile_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetProfileUseCase {
  ProfileRepository profileRespository;
  GetProfileUseCase({required this.profileRespository});
  Future<Either<AdminExceptions, ProfileEntity>> call(String token) async {
    return await profileRespository.getProfile(token);
  }
}
