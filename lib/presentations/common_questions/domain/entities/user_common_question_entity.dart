import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserCommonQuestionEntity extends Equatable {
  int id;
  String question;
  String? answer;
  String createDate;
  String userName;
  UserCommonQuestionEntity({
    required this.id,
    required this.userName,
    required this.question,
    required this.answer,
    required this.createDate,
  });
  factory UserCommonQuestionEntity.init() => UserCommonQuestionEntity(
    id: -1,
    userName: '',
    question: '',
    answer: '',
    createDate: '',
  );
  @override
  List<Object?> get props => [id, question, answer, createDate, userName];
}
