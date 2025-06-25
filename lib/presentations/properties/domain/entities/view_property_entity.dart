import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ViewPropertyEntity extends Equatable {
  RequestDescriptionInfoEntity requestDescriptionInfoEntity;
  RequestImagesInfoEntity requestImagesInfoEntity;
  ViewPropertyEntity({
    required this.requestDescriptionInfoEntity,
    required this.requestImagesInfoEntity,
  });
  factory ViewPropertyEntity.init() => ViewPropertyEntity(
    requestDescriptionInfoEntity: RequestDescriptionInfoEntity.init(),
    requestImagesInfoEntity: RequestImagesInfoEntity.init(),
  );

  @override
  List<Object?> get props => [
    requestDescriptionInfoEntity,
    requestImagesInfoEntity,
  ];
}
