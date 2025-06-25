import 'package:admin_dashboard/presentations/auth/domain/entities/auth_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/entities/reset_password_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/entities/verify_code_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<AdminExceptions, ResponseAuthEntity>> login(AuthEntity auth);
  Future<Either<AdminExceptions, String>> logout(String token);

  Future<Either<AdminExceptions, String>> sendVerifyCode(String email);
  Future<Either<AdminExceptions, String>> verifyCode(
    VerifyCodeEntity verifyCodeEntity,
  );
  Future<Either<AdminExceptions, String>> resetPassword(
    ResetPasswordEntity resetPassword,
  );
}
