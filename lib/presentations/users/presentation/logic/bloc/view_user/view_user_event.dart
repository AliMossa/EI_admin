part of 'view_user_bloc.dart';

sealed class ViewUserEvent extends Equatable {
  const ViewUserEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class GetUserInformationEvent extends ViewUserEvent {
  int id;
  GetUserInformationEvent({required this.id});
}

// ignore: must_be_immutable
class ActivateUserEvent extends ViewUserEvent {
  int id;
  ActivateUserEvent({required this.id});
}

// ignore: must_be_immutable
class UnActivateUserEvent extends ViewUserEvent {
  int id;
  UnActivateUserEvent({required this.id});
}
