part of 'active_user_cubit.dart';

sealed class ActiveUserState extends Equatable {
  const ActiveUserState();

  @override
  List<Object> get props => [];
}

final class ActiveUserInitial extends ActiveUserState {}

class LoadingActiveUserState extends ActiveUserState {}

class DoActiveUserState extends ActiveUserState {}
