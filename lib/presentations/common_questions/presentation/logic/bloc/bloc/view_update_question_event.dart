part of 'view_update_question_bloc.dart';

sealed class ViewUpdateQuestionEvent extends Equatable {
  const ViewUpdateQuestionEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class UpdateAdminCommonQuestionEvent extends ViewUpdateQuestionEvent {
  int id;
  UpdateAdminCommonQuestionEvent({required this.id});
}

// ignore: must_be_immutable
class RemoveAdminCommonQuestionFromInsidEvent extends ViewUpdateQuestionEvent {
  int id;
  RemoveAdminCommonQuestionFromInsidEvent({required this.id});
}

// ignore: must_be_immutable
class RemoveUserCommonQuestionEvent extends ViewUpdateQuestionEvent {
  int id;
  RemoveUserCommonQuestionEvent({required this.id});
}
