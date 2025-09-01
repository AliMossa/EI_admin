part of 'view_update_question_bloc.dart';

sealed class ViewUpdateQuestionState extends Equatable {
  const ViewUpdateQuestionState();

  @override
  List<Object> get props => [];
}

final class ViewUpdateQuestionInitial extends ViewUpdateQuestionState {}

class LoadingUpdateAdminCommonQuestionState extends ViewUpdateQuestionState {}

class SuccessUpdateAdminCommonQuestionState extends ViewUpdateQuestionState {}

// ignore: must_be_immutable
class FailedUpdateAdminCommonQuestionState extends ViewUpdateQuestionState {
  String message;
  FailedUpdateAdminCommonQuestionState({required this.message});
}

class LoadingRemoveAdminCommonQuestionFromInsideState
    extends ViewUpdateQuestionState {}

class SuccessRemoveAdminCommonQuestionFromInsideState
    extends ViewUpdateQuestionState {}

// ignore: must_be_immutable
class FailedRemoveAdminCommonQuestionFromInsideState
    extends ViewUpdateQuestionState {
  String message;
  FailedRemoveAdminCommonQuestionFromInsideState({required this.message});
}

class LoadingRemoveUserCommonQuestionState extends ViewUpdateQuestionState {}

class SuccessRemoveUserCommonQuestionState extends ViewUpdateQuestionState {}

// ignore: must_be_immutable
class FailedRemoveUserCommonQuestionState extends ViewUpdateQuestionState {
  String message;
  FailedRemoveUserCommonQuestionState({required this.message});
}
