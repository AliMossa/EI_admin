import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchTypeModel extends Equatable {
  int id;
  String name;
  SearchTypeModel({required this.id, required this.name});
  @override
  List<Object?> get props => [id, name];
}
