part of 'add_reward_bloc.dart';

sealed class AddRewardState extends Equatable {
  const AddRewardState();

  @override
  List<Object> get props => [];
}

final class AddRewardInitial extends AddRewardState {}

class LoadingAddNewRewardState extends AddRewardState {}

class SuccessAddNewRewardState extends AddRewardState {}

// ignore: must_be_immutable
class FailedAddNewRewardState extends AddRewardState {
  String message;
  FailedAddNewRewardState({required this.message});
}
