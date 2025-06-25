import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestEntity extends Equatable {
  int id;
  int economicEvaluationId;
  String adminNote;
  String status;
  String createdAt;
  String lawyerTimeAcceptance;
  String expertTeamTimeAcceptance;

  RequestEntity({
    required this.id,
    required this.economicEvaluationId,
    required this.adminNote,
    required this.status,
    required this.createdAt,
    required this.expertTeamTimeAcceptance,
    required this.lawyerTimeAcceptance,
  });
  @override
  List<Object?> get props => [
    id,
    economicEvaluationId,
    adminNote,
    status,
    createdAt,
    lawyerTimeAcceptance,
    expertTeamTimeAcceptance,
  ];
}
