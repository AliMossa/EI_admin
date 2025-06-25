import 'package:admin_dashboard/presentations/profile/domain/entities/update_enitity.dart';
import 'package:admin_dashboard/presentations/profile/domain/repositories/profile_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UpdateProfileUseCase {
  ProfileRepository profileRespository;
  UpdateProfileUseCase({required this.profileRespository});
  Future<Either<AdminExceptions, String>> call(
    UpdateEnitity updateEnitity,
    String token,
  ) async {
    print('use case');
    return await profileRespository.updateProfile(updateEnitity, token);
  }
}
