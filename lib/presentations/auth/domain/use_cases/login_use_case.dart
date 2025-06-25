import 'package:admin_dashboard/presentations/auth/domain/entities/auth_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/repositories/auth_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<AdminExceptions, ResponseAuthEntity>> call(
    AuthEntity auth,
  ) async {
    return await authRepository.login(auth);
  }
}
