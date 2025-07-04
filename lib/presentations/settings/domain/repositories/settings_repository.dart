import 'package:admin_dashboard/presentations/settings/domain/entities/change_password_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  Future<Either<AdminExceptions, String>> changePassword(
    ChangePasswordEntity changePasswordEntity,
  );
}
