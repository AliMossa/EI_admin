part of 'common_questions_bloc.dart';

sealed class CommonQuestionsEvent extends Equatable {
  const CommonQuestionsEvent();

  @override
  List<Object> get props => [];
}

class GetSuitableCommonQuestionEvent extends CommonQuestionsEvent {}

class GetAdminCommonQuestionsEvent extends CommonQuestionsEvent {}

class GetUserCommonQuestionsEvent extends CommonQuestionsEvent {}

// ignore: must_be_immutable
class RemoveAdminCommonQuestionEvent extends CommonQuestionsEvent {
  int id;
  RemoveAdminCommonQuestionEvent({required this.id});
}

// ignore: must_be_immutable
class ReGetUserCommonQuestionsEvent extends CommonQuestionsEvent {
  String link;
  ReGetUserCommonQuestionsEvent({required this.link});
}

// ignore: must_be_immutable
class ReGetAdminCommonQuestionsEvent extends CommonQuestionsEvent {
  String link;
  ReGetAdminCommonQuestionsEvent({required this.link});
}
