import 'package:admin_dashboard/presentations/profile/domain/entities/logs_request_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/repositories/profile_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetLogsUseCase {
  ProfileRepository profileRespository;
  GetLogsUseCase({required this.profileRespository});

  Future<Either<AdminExceptions, TotalProfileLogsEntity>> call(
    LogsRequestEntity logsRequestEntity,
  ) async => await profileRespository.getLogs(logsRequestEntity);
}
