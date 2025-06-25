part of 'view_update_reward_bloc.dart';

sealed class ViewUpdateRewardState extends Equatable {
  const ViewUpdateRewardState();

  @override
  List<Object> get props => [];
}

final class ViewUpdateRewardInitial extends ViewUpdateRewardState {}

class LoadingUpdateRewardState extends ViewUpdateRewardState {}

class SuccessUpdateRewardState extends ViewUpdateRewardState {}

// ignore: must_be_immutable
class FailedUpdateRewardState extends ViewUpdateRewardState {
  String message;
  FailedUpdateRewardState({required this.message});
}

class LoadingRemoveRewardState extends ViewUpdateRewardState {}

class SuccessRemoveRewardState extends ViewUpdateRewardState {}

// ignore: must_be_immutable
class FailedRemoveRewardState extends ViewUpdateRewardState {
  String message;
  FailedRemoveRewardState({required this.message});
}
