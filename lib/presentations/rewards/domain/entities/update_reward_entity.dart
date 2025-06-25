import 'package:admin_dashboard/presentations/rewards/domain/entities/reward_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateRewardEntity extends Equatable {
  int id;
  String token;
  RewardEntity data;
  UpdateRewardEntity({
    required this.id,
    required this.token,
    required this.data,
  });
  @override
  List<Object?> get props => [id, token, data];
}
