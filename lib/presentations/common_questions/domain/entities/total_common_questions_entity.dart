import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalCommonQuestionsEntity extends Equatable {
  List<CommonQuestionsEntity> list;
  String nextPage;
  TotalCommonQuestionsEntity({required this.list, required this.nextPage});
  factory TotalCommonQuestionsEntity.init() =>
      TotalCommonQuestionsEntity(list: [], nextPage: '');

  @override
  List<Object?> get props => [list, nextPage];
}
