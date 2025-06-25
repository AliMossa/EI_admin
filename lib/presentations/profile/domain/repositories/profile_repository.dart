import 'package:admin_dashboard/presentations/profile/domain/entities/logs_request_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/profiel_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/update_enitity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepository {
  Future<Either<AdminExceptions, ProfileEntity>> getProfile(String token);
  Future<Either<AdminExceptions, String>> updateProfile(
    UpdateEnitity updateEnitity,
    String token,
  );
  Future<Either<AdminExceptions, TotalProfileLogsEntity>> getLogs(
    LogsRequestEntity logsRequestEntity,
  );
  Future<Either<AdminExceptions, TotalProfileLogsEntity>> reGetLogs(
    String link,
  );
}
