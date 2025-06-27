import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestsStatisticsEntity extends Equatable {
  double rejectedByLawyer;
  double acceptedByAdmin;
  double rejectedByUser;
  RequestsStatisticsEntity({
    required this.rejectedByLawyer,
    required this.acceptedByAdmin,
    required this.rejectedByUser,
  });
  factory RequestsStatisticsEntity.init() => RequestsStatisticsEntity(
    acceptedByAdmin: 0,
    rejectedByLawyer: 0,
    rejectedByUser: 0,
  );
  @override
  List<Object?> get props => [
    rejectedByLawyer,
    rejectedByUser,
    acceptedByAdmin,
  ];
}
