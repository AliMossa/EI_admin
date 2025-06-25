import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalRewardEntity extends Equatable {
  String nextPage;
  List<RewardEntity> rewards;
  TotalRewardEntity({required this.nextPage, required this.rewards});
  factory TotalRewardEntity.init() =>
      TotalRewardEntity(nextPage: '', rewards: []);
  @override
  List<Object?> get props => [nextPage, rewards];
}
