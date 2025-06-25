import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class MonthModel extends Equatable {
  int id;
  String name;
  MonthModel({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
