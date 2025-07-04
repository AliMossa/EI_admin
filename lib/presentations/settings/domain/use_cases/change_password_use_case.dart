import 'package:admin_dashboard/presentations/settings/domain/entities/change_password_entity.dart';
import 'package:admin_dashboard/presentations/settings/domain/repositories/settings_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ChangePasswordUseCase {
  SettingsRepository settingsRepository;
  ChangePasswordUseCase({required this.settingsRepository});

  Future<Either<AdminExceptions, String>> call(
    ChangePasswordEntity changePasswordEntity,
  ) async {
    return await settingsRepository.changePassword(changePasswordEntity);
  }
}
