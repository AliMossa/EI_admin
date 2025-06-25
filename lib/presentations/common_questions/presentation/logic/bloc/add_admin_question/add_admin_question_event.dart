part of 'add_admin_question_bloc.dart';

sealed class AddAdminQuestionEvent extends Equatable {
  const AddAdminQuestionEvent();

  @override
  List<Object> get props => [];
}

class AddAdminCommonQuestionEvent extends AddAdminQuestionEvent {}

class UpdateAdminCommonQuestionEvent extends AddAdminQuestionEvent {}
