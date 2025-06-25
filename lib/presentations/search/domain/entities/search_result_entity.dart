import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SearchResultEntity extends Equatable {
  int id;
  int roleId;
  String name;
  String email;
  String phone;
  String joinedDate;
  SearchResultEntity({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phone,
    required this.joinedDate,
  });

  @override
  List<Object?> get props => [id, roleId, name, email, phone, joinedDate];
}
