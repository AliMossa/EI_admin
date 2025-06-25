part of 'rewards_bloc.dart';

sealed class RewardsState extends Equatable {
  const RewardsState();

  @override
  List<Object> get props => [];
}

final class RewardsInitial extends RewardsState {}

class LoadingGetRewardsState extends RewardsState {}

class SuccessGetRewardsState extends RewardsState {}

// ignore: must_be_immutable
class FailedGetRewardsState extends RewardsState {
  String message;
  FailedGetRewardsState({required this.message});
}

class LoadingReGetRewardsState extends RewardsState {}

class SuccessReGetRewardsState extends RewardsState {}

// ignore: must_be_immutable
class FailedReGetRewardsState extends RewardsState {
  String message;
  FailedReGetRewardsState({required this.message});
}
