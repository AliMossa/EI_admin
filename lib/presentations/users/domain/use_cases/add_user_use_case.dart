import 'package:admin_dashboard/presentations/users/domain/entities/add_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/repositories/user_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AddUserUseCase {
  UserRepository userRepository;
  AddUserUseCase({required this.userRepository});

  Future<Either<AdminExceptions, String>> call(AddUserEntity userEntity) async {
    return userRepository.addUser(userEntity);
  }
}
