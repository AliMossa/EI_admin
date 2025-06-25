part of 'member_image_cubit.dart';

sealed class MemberImageState extends Equatable {
  const MemberImageState();

  @override
  List<Object> get props => [];
}

final class MemberImageInitial extends MemberImageState {}

class HoverMemberImageState extends MemberImageState {}

class EndHoverMemberImageState extends MemberImageState {}

class AddMemberImageState extends MemberImageState {}

class LoadingAddMemberImageState extends MemberImageState {}
