import 'package:admin_dashboard/presentations/requests/domain/entities/documents_images_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ViewPropertyEntity extends Equatable {
  String? aggreement;
  RequestDescriptionInfoEntity requestDescriptionInfoEntity;
  RequestImagesInfoEntity requestImagesInfoEntity;
  RequestEconomicInfoEntity requestEconomicInfoEntity;
  DocumentsImagesEntity documentsImagesEntity;
  ViewPropertyEntity({
    required this.aggreement,
    required this.requestDescriptionInfoEntity,
    required this.requestImagesInfoEntity,
    required this.requestEconomicInfoEntity,
    required this.documentsImagesEntity,
  });
  factory ViewPropertyEntity.init() => ViewPropertyEntity(
    aggreement: '',
    requestDescriptionInfoEntity: RequestDescriptionInfoEntity.init(),
    requestImagesInfoEntity: RequestImagesInfoEntity.init(),
    documentsImagesEntity: DocumentsImagesEntity.init(),
    requestEconomicInfoEntity: RequestEconomicInfoEntity.init(),
  );

  @override
  List<Object?> get props => [
    requestDescriptionInfoEntity,
    requestImagesInfoEntity,
  ];
}
