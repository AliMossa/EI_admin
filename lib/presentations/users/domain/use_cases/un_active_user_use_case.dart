import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/repositories/user_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UnActiveUserUseCase {
  UserRepository userRepository;
  UnActiveUserUseCase({required this.userRepository});
  Future<Either<AdminExceptions, String>> call(
    ActivateUserEntity activateUserEntity,
  ) async {
    return await userRepository.unActiveUser(activateUserEntity);
  }
}
