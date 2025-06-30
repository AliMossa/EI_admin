import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class DocumentsImagesEntity extends Equatable {
  List<String> images;
  DocumentsImagesEntity({required this.images});
  factory DocumentsImagesEntity.init() => DocumentsImagesEntity(images: []);
  @override
  List<Object?> get props => [images];
}
