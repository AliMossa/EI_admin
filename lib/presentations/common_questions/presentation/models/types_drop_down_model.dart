import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TypesDropDownModel extends Equatable {
  int id;
  String name;
  TypesDropDownModel({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
