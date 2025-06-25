import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestSuccessStatisticsEntity extends Equatable {
  int year;
  String token;

  RequestSuccessStatisticsEntity({required this.token, required this.year});

  @override
  List<Object?> get props => [year, token];
}
