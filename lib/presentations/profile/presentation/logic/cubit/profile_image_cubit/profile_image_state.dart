part of 'profile_image_cubit.dart';

sealed class ProfileImageState extends Equatable {
  const ProfileImageState();

  @override
  List<Object> get props => [];
}

final class ProfileImageInitial extends ProfileImageState {}

class HoverProfileImageState extends ProfileImageState {}

class EndHoverProfileImageState extends ProfileImageState {}
