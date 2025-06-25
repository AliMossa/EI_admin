import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/repositories/user_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetUsersUseCase {
  UserRepository userRepository;
  ReGetUsersUseCase({required this.userRepository});

  Future<Either<AdminExceptions, TotalUserEntity>> call(String link) async {
    return await userRepository.reGetUserInfo(link);
  }
}
