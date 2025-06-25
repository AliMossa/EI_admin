import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddRewardEntity extends Equatable {
  RewardEntity data;
  String token;
  AddRewardEntity({required this.data, required this.token});

  @override
  List<Object?> get props => [data, token];
}
