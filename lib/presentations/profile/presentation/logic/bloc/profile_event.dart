part of 'profile_bloc.dart';

sealed class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfileInfoEvent extends ProfileEvent {}

// ignore: must_be_immutable
class UpdateProfileInfoEvent extends ProfileEvent {}
