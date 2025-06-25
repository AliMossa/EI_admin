import 'dart:io';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UpdateImageEntity extends Equatable {
  String token;
  File image;
  UpdateImageEntity({required this.image, required this.token});

  @override
  List<Object?> get props => [image, token];
}
