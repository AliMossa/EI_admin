import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestImagesInfoEntity extends Equatable {
  List<String> images;
  List<String> documents;
  List<String> ids;
  RequestImagesInfoEntity({
    required this.images,
    required this.documents,
    required this.ids,
  });
  factory RequestImagesInfoEntity.init() =>
      RequestImagesInfoEntity(images: [], documents: [], ids: []);
  @override
  List<Object?> get props => [images, documents, ids];
}
