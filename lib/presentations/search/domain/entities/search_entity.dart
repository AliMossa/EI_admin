import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchEntity extends Equatable {
  int roleId;
  String name;
  String? fatherName;
  String? motherName;
  SearchEntity({
    required this.roleId,
    required this.name,
    required this.fatherName,
    required this.motherName,
  });
  @override
  List<Object?> get props => [roleId, name, fatherName, motherName];
}
