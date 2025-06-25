import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateEmployeeEntity extends Equatable {
  int roleId;
  String? name;
  String? fatherName;
  String? motherName;
  String? phone;
  String? email;
  String? dateOfBirth;
  String? address;
  MultipartFile? backIdImage;
  MultipartFile? frontIdImage;
  MultipartFile? personalPhoto;
  UpdateEmployeeEntity({
    required this.roleId,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.phone,
    required this.email,
    required this.dateOfBirth,
    required this.address,
    required this.backIdImage,
    required this.frontIdImage,
    required this.personalPhoto,
  });

  factory UpdateEmployeeEntity.init() => UpdateEmployeeEntity(
    roleId: 0,
    name: null,
    email: null,
    phone: null,
    fatherName: null,
    motherName: null,
    address: null,
    dateOfBirth: null,
    backIdImage: null,
    frontIdImage: null,
    personalPhoto: null,
  );

  @override
  List<Object?> get props => [
    roleId,
    name,
    fatherName,
    motherName,
    email,
    phone,
    dateOfBirth,
    address,
    personalPhoto,
    frontIdImage,
    backIdImage,
  ];
}
