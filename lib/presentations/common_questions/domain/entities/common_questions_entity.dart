import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CommonQuestionsEntity extends Equatable {
  int id;
  String question;
  String answer;
  String createDate;
  String updateDate;
  CommonQuestionsEntity({
    required this.id,
    required this.question,
    required this.answer,
    required this.createDate,
    required this.updateDate,
  });

  factory CommonQuestionsEntity.init() => CommonQuestionsEntity(
    id: -1,
    answer: '',
    question: '',
    createDate: '',
    updateDate: '',
  );

  @override
  List<Object?> get props => [
    id,
    question,
    answer,
    answer,
    createDate,
    updateDate,
  ];
}
