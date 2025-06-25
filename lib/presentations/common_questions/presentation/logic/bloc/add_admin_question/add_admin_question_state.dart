part of 'add_admin_question_bloc.dart';

sealed class AddAdminQuestionState extends Equatable {
  const AddAdminQuestionState();

  @override
  List<Object> get props => [];
}

final class AddAdminQuestionInitial extends AddAdminQuestionState {}

class LoadingAddAdminCommonQuestionState extends AddAdminQuestionState {}

class SuccessAddAdminCommonQuestionState extends AddAdminQuestionState {}

// ignore: must_be_immutable
class FailedAddAdminCommonQuestionState extends AddAdminQuestionState {
  String message;
  FailedAddAdminCommonQuestionState({required this.message});
}
