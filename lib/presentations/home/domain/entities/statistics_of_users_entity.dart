import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class StatisticsOfUsersEntity extends Equatable {
  int admins;
  int investors;
  int legalTeams;
  int economicTeams;
  StatisticsOfUsersEntity({
    required this.admins,
    required this.investors,
    required this.economicTeams,
    required this.legalTeams,
  });
  factory StatisticsOfUsersEntity.init() => StatisticsOfUsersEntity(
    admins: 0,
    economicTeams: 0,
    investors: 0,
    legalTeams: 0,
  );
  @override
  List<Object?> get props => [admins, investors, legalTeams, economicTeams];
}
