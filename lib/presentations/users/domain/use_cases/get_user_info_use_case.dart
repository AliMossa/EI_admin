import 'package:admin_dashboard/presentations/users/domain/entities/get_user_info_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/repositories/user_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetUserInfoUseCase {
  UserRepository userRepository;
  GetUserInfoUseCase({required this.userRepository});
  Future<Either<AdminExceptions, UserEntity>> call(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  ) async {
    return await userRepository.getUserInfo(getUserInfoRequestEntity);
  }
}
