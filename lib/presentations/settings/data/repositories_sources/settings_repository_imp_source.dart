import 'package:admin_dashboard/presentations/settings/data/data_sources/change_password_data_source.dart';
import 'package:admin_dashboard/presentations/settings/domain/entities/change_password_entity.dart';
import 'package:admin_dashboard/presentations/settings/domain/repositories/settings_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpSource implements SettingsRepository {
  @override
  Future<Either<AdminExceptions, String>> changePassword(
    ChangePasswordEntity changePasswordEntity,
  ) async {
    try {
      return right(
        await ChangePasswordDataSourceWithDio().changePassword(
          changePasswordEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
