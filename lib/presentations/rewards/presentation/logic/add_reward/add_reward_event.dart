part of 'add_reward_bloc.dart';

sealed class AddRewardEvent extends Equatable {
  const AddRewardEvent();

  @override
  List<Object> get props => [];
}

class AddNewRewardEvent extends AddRewardEvent {}
