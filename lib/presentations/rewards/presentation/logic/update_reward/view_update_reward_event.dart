part of 'view_update_reward_bloc.dart';

sealed class ViewUpdateRewardEvent extends Equatable {
  const ViewUpdateRewardEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class UpdateRewardEvent extends ViewUpdateRewardEvent {
  int id;
  UpdateRewardEvent({required this.id});
}

// ignore: must_be_immutable
class RemoveRewardEvent extends ViewUpdateRewardEvent {
  int id;
  RemoveRewardEvent({required this.id});
}
