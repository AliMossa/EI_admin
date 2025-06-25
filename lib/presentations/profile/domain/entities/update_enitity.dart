import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateEnitity extends Equatable {
  String email;
  String phone;
  MultipartFile? image;
  UpdateEnitity({
    required this.email,
    required this.phone,
    required this.image,
  });
  @override
  List<Object?> get props => [email, phone, image];
}
