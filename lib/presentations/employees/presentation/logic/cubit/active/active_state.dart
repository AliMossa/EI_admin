part of 'active_cubit.dart';

sealed class ActiveState extends Equatable {
  const ActiveState();

  @override
  List<Object> get props => [];
}

final class ActiveInitial extends ActiveState {}

class ChangeActiveState extends ActiveState {}

class LoadingChangeActiveState extends ActiveState {}
