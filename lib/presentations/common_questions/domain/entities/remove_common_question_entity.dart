import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RemoveCommonQuestionEntity extends Equatable {
  int id;
  String token;
  RemoveCommonQuestionEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
