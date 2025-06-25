import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DropDownModel extends Equatable {
  int id;
  String name;
  DropDownModel({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
