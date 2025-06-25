import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class StatisticsEntity extends Equatable {
  int id;
  double value;
  StatisticsEntity({required this.id, required this.value});
  @override
  List<Object?> get props => [id, value];
}
