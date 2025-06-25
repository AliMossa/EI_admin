import 'package:equatable/equatable.dart';

class RewardEntity extends Equatable {
  int id;
  int? percentage;
  int? amountThreshold;
  String? level;
  int? times;
  String createdAt;
  String updatedAt;
  RewardEntity({
    required this.id,
    required this.percentage,
    required this.amountThreshold,
    required this.level,
    required this.times,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    percentage,
    amountThreshold,
    level,
    createdAt,
    updatedAt,
  ];
}
