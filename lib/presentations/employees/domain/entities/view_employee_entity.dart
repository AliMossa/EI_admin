import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ViewEmployeeEntity extends Equatable {
  int id;
  int roleId;
  int isAcitve;
  String? name;
  String? fatherName;
  String? motherName;
  String? phone;
  String? email;
  String? dateOfBirth;
  String? address;
  String? backIdImage;
  String? frontIdImage;
  String? personalPhoto;
  ViewEmployeeEntity({
    required this.id,
    required this.roleId,
    required this.isAcitve,
    required this.name,
    required this.fatherName,
    required this.motherName,
    required this.phone,
    required this.email,
    required this.dateOfBirth,
    required this.address,
    required this.personalPhoto,
    required this.frontIdImage,
    required this.backIdImage,
  });
  factory ViewEmployeeEntity.init() => ViewEmployeeEntity(
    id: -1,
    roleId: -1,
    isAcitve: 0,
    name: '',
    fatherName: '',
    motherName: '',
    phone: '',
    email: '',
    dateOfBirth: '',
    address: '',
    backIdImage: '',
    frontIdImage: '',
    personalPhoto: '',
  );
  @override
  List<Object?> get props => [
    id,
    roleId,
    isAcitve,
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
