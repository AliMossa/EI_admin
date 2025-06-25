import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddCommonQuestionEntity extends Equatable {
  String token;
  String question;
  String answer;
  AddCommonQuestionEntity({
    required this.token,
    required this.question,
    required this.answer,
  });

  @override
  List<Object?> get props => [token, question, answer];
}
