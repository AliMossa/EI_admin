import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateUserQuestionEntity extends Equatable {
  int id;
  String token;
  String answer;
  UpdateUserQuestionEntity({
    required this.id,
    required this.answer,
    required this.token,
  });

  @override
  List<Object?> get props => [id, token, answer];
}
