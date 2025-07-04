import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SuccessStatisticsEntity extends Equatable {
  int id;
  double value;
  SuccessStatisticsEntity({required this.id, required this.value});
  @override
  List<Object?> get props => [id, value];
}
