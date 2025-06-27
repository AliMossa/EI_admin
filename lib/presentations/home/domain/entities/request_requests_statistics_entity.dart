import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestRequestsStatisticsEntity extends Equatable {
  int year;
  String token;
  RequestRequestsStatisticsEntity({required this.year, required this.token});

  @override
  List<Object?> get props => [year, token];
}
