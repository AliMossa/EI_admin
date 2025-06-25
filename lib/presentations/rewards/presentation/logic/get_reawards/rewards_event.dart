part of 'rewards_bloc.dart';

sealed class RewardsEvent extends Equatable {
  const RewardsEvent();

  @override
  List<Object> get props => [];
}

class GetRewardsEvent extends RewardsEvent {}

// ignore: must_be_immutable
class ReGetRewardsEvent extends RewardsEvent {
  String link;
  ReGetRewardsEvent({required this.link});
}
