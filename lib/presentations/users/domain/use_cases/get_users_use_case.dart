import 'package:admin_dashboard/presentations/users/domain/entities/get_user_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/repositories/user_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetUsersUseCase {
  UserRepository userRepository;
  GetUsersUseCase({required this.userRepository});
  Future<Either<AdminExceptions, TotalUserEntity>> call(
    GetUserRequestEntity getUserRequestEntity,
  ) async {
    return await userRepository.getUsers(getUserRequestEntity);
  }
}
