import 'package:admin_dashboard/presentations/profile/domain/entities/total_profile_logs_entity.dart';
import 'package:admin_dashboard/presentations/profile/domain/repositories/profile_repository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetLogsUseCase {
  ProfileRepository profileRepository;
  ReGetLogsUseCase({required this.profileRepository});
  Future<Either<AdminExceptions, TotalProfileLogsEntity>> call(
    String link,
  ) async {
    return await profileRepository.reGetLogs(link);
  }
}
