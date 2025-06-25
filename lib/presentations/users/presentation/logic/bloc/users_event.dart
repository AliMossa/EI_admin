part of 'users_bloc.dart';

sealed class UsersEvent extends Equatable {
  const UsersEvent();

  @override
  List<Object> get props => [];
}

class GetUserEvent extends UsersEvent {}

// ignore: must_be_immutable
class ReGetUserEvent extends UsersEvent {
  String link;
  ReGetUserEvent({required this.link});
}
