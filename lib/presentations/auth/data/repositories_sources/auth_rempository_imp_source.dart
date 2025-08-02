import 'package:admin_dashboard/presentations/auth/data/data_sources/login_data_source.dart';
import 'package:admin_dashboard/presentations/auth/data/data_sources/logout_data_source.dart';
import 'package:admin_dashboard/presentations/auth/data/data_sources/reset_password_data_source.dart';
import 'package:admin_dashboard/presentations/auth/data/data_sources/send_verification_code_data_source.dart';
import 'package:admin_dashboard/presentations/auth/data/data_sources/verify_code_data_source.dart';
import 'package:admin_dashboard/presentations/auth/domain/entities/auth_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/entities/reset_password_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/entities/verify_code_entity.dart';
import 'package:admin_dashboard/presentations/auth/domain/repositories/auth_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class AuthRempositoryImpSource implements AuthRepository {
  @override
  Future<Either<AdminExceptions, ResponseAuthEntity>> login(
    AuthEntity auth,
  ) async {
    try {
      return right(await LoginDataSourceWithDio().login(auth));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> sendVerifyCode(String email) async {
    try {
      return right(
        await SendVerificationCodeDataSourceWithDio().sendVerificationCode(
          email,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> verifyCode(
    VerifyCodeEntity verifyCodeEntity,
  ) async {
    try {
      return right(
        await VerifyCodeDataSourceWithDio().verifyCode(verifyCodeEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> resetPassword(
    ResetPasswordEntity resetPasswordEntity,
  ) async {
    try {
      return right(
        await ResetPasswordDataSourceWithDio().resetPassoword(
          resetPasswordEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> logout(String token) async {
    try {
      return right(await LogoutDataSourceWithDio().logout(token));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
