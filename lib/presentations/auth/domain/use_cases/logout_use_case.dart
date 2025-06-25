import 'package:admin_dashboard/presentations/auth/domain/repositories/auth_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  AuthRepository authRepository;
  LogoutUseCase({required this.authRepository});
  Future<Either<AdminExceptions, String>> call(String token) async {
    return await authRepository.logout(token);
  }
}
