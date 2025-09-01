part of 'common_questions_bloc.dart';

sealed class CommonQuestionsState extends Equatable {
  const CommonQuestionsState();

  @override
  List<Object> get props => [];
}

final class CommonQuestionsInitial extends CommonQuestionsState {}

final class StartGetSuitalbeCommonQuestionsState extends CommonQuestionsState {}

class LoadingGetAdminCommonQuestionsState extends CommonQuestionsState {}

class SuccessGetAdminCommonQuestionsState extends CommonQuestionsState {}

// ignore: must_be_immutable
class FailedGetAdminCommonQuestionsState extends CommonQuestionsState {
  String message;
  FailedGetAdminCommonQuestionsState({required this.message});
}

class LoadingGetUserCommonQuestionsState extends CommonQuestionsState {}

class SuccessGetUserCommonQuestionsState extends CommonQuestionsState {}

// ignore: must_be_immutable
class FailedGetUserCommonQuestionsState extends CommonQuestionsState {
  String message;
  FailedGetUserCommonQuestionsState({required this.message});
}

class LoadingRemoveAdminCommonQuestionState extends CommonQuestionsState {}

class SuccessRemoveAdminCommonQuestionState extends CommonQuestionsState {}

// ignore: must_be_immutable
class FailedRemoveAdminCommonQuestionState extends CommonQuestionsState {
  String message;
  FailedRemoveAdminCommonQuestionState({required this.message});
}

class LoadingReGetAdminCommonQuestionsState extends CommonQuestionsState {}

class SuccessReGetAdminCommonQuestionsState extends CommonQuestionsState {}

// ignore: must_be_immutable
class FailedReGetAdminCommonQuestionsState extends CommonQuestionsState {
  String message;
  FailedReGetAdminCommonQuestionsState({required this.message});
}

class LoadingReGetUserCommonQuestionsState extends CommonQuestionsState {}

class SuccessReGetUserCommonQuestionsState extends CommonQuestionsState {}

// ignore: must_be_immutable
class FailedReGetUserCommonQuestionsState extends CommonQuestionsState {
  String message;
  FailedReGetUserCommonQuestionsState({required this.message});
}
