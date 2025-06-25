import 'dart:io';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProfileEntity extends Equatable {
  int id;
  int roleId;
  String name;
  String email;
  String phone;
  String joindedDate;
  String pesonalPhoto;
  ProfileEntity({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.phone,
    required this.joindedDate,
    required this.pesonalPhoto,
  });

  factory ProfileEntity.init() => ProfileEntity(
    id: -1,
    roleId: -1,
    name: '',
    email: '',
    pesonalPhoto: '',
    joindedDate: '',
    phone: '',
  );
  @override
  List<Object?> get props => [
    id,
    roleId,
    name,
    phone,
    joindedDate,
    pesonalPhoto,
  ];
}
