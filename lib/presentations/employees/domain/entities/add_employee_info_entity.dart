import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AddEmployeeInfoEntity extends Equatable {
  int roleId;
  String name;
  String fatherName;
  String motherName;
  String phone;
  String email;
  String password;
  String confrimPassword;
  String dateOfBirth;
  String address;
  MultipartFile? backIdImage;
  MultipartFile? frontIdImage;
  MultipartFile? personalPhoto;
  AddEmployeeInfoEntity({
    required this.roleId,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.phone,
    required this.email,
    required this.password,
    required this.confrimPassword,
    required this.dateOfBirth,
    required this.address,
    required this.personalPhoto,
    required this.frontIdImage,
    required this.backIdImage,
  });

  @override
  List<Object?> get props => [
    roleId,
    name,
    phone,
    email,
    dateOfBirth,
    address,
    personalPhoto,
    frontIdImage,
    backIdImage,
  ];
}
