import 'package:admin_dashboard/presentations/profile/data/data_sources/get_profile_info_data_source.dart';
import 'package:admin_dashboard/presentations/profile/data/data_sources/get_profile_logs_data_source.dart';
import 'package:admin_dashboard/presentations/profile/data/data_sources/re_get_profile_logs_data_source.dart';
import 'package:admin_dashboard/presentations/profile/data/data_sources/update_profile_info_data_source.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/logs_request_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/update_enitity.dart';
import 'package:admin_dashboard/presentations/profile/domain/repositories/profile_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpSource implements ProfileRepository {
  @override
  Future<Either<AdminExceptions, ProfileEntity>> getProfile(
    String token,
  ) async {
    try {
      return right(
        await GetProfileInfoDataSourceWithDio().getProfileInfo(token),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> updateProfile(
    UpdateEnitity updateEnitity,
    String token,
  ) async {
    try {
      return right(
        await UpdateProfileInfoDataSourceWithDio().updateProfileInfo(
          updateEnitity,
          token,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalProfileLogsEntity>> getLogs(
    LogsRequestEntity logsRequestEntity,
  ) async {
    try {
      return right(
        await GetProfileLogsDataSourceWithDio().getProfileLogs(
          logsRequestEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return Left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalProfileLogsEntity>> reGetLogs(
    String link,
  ) async {
    try {
      return right(
        await ReGetProfileLogsDataSourceWithDio().reGetProfileLogs(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
