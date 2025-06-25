import 'package:admin_dashboard/presentations/auth/domain/entities/verify_code_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/repositories/auth_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class VerifyCodeUseCase {
  AuthRepository authRepository;
  VerifyCodeUseCase({required this.authRepository});
  Future<Either<AdminExceptions, String>> call(
    VerifyCodeEntity verifyCodeEntity,
  ) async {
    return await authRepository.verifyCode(verifyCodeEntity);
  }
}
