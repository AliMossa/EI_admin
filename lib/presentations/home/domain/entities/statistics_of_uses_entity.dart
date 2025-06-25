import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class StatisticsOfUsesEntity extends Equatable {
  int admins;
  int investors;
  int legalTeams;
  int economicTeams;
  StatisticsOfUsesEntity({
    required this.admins,
    required this.investors,
    required this.economicTeams,
    required this.legalTeams,
  });

  @override
  List<Object?> get props => [admins, investors, legalTeams, economicTeams];
}
