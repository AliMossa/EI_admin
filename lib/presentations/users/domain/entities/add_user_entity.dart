import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddUserEntity extends Equatable {
  int roleId;
  String name;
  String email;
  String phone;
  String password;
  String confirmPassword;
  AddUserEntity({
    required this.roleId,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.confirmPassword,
  });
  @override
  List<Object?> get props => [
    roleId,
    name,
    email,
    phone,
    password,
    confirmPassword,
  ];
}
