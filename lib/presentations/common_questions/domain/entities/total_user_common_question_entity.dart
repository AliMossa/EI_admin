import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalUserCommonQuestionEntity extends Equatable {
  List<UserCommonQuestionEntity> questions;
  String nextPage;
  TotalUserCommonQuestionEntity({
    required this.questions,
    required this.nextPage,
  });
  factory TotalUserCommonQuestionEntity.init() =>
      TotalUserCommonQuestionEntity(questions: [], nextPage: '');
  @override
  List<Object?> get props => [];
}
