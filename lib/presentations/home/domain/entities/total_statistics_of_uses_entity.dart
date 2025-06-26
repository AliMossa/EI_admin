import 'package:admin_dashboard/presentations/home/domain/entities/statistics_of_users_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalStatisticsOfUsesEntity extends Equatable {
  double adminsPercent;
  double invesetorsPercent;
  double legalTeamPercent;
  double economicTeamPercent;

  StatisticsOfUsersEntity statisticsOfUsersEntity;
  TotalStatisticsOfUsesEntity({
    required this.statisticsOfUsersEntity,
    required this.adminsPercent,
    required this.economicTeamPercent,
    required this.invesetorsPercent,
    required this.legalTeamPercent,
  });
  factory TotalStatisticsOfUsesEntity.init() => TotalStatisticsOfUsesEntity(
    adminsPercent: 0,
    economicTeamPercent: 0,
    invesetorsPercent: 0,
    legalTeamPercent: 0,
    statisticsOfUsersEntity: StatisticsOfUsersEntity.init(),
  );
  @override
  List<Object?> get props => [
    adminsPercent,
    invesetorsPercent,
    legalTeamPercent,
    economicTeamPercent,
    statisticsOfUsersEntity,
  ];
}
