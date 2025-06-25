import 'package:admin_dashboard/presentations/requests/domain/entities/request_description_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_economic_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_images_info_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestInfoEntity extends Equatable {
  int id;
  String? adminNote;
  String requestStatus;
  String creatingDate;
  RequestEconomicInfoEntity requestEconomicInfoEntity;
  RequestDescriptionInfoEntity requestDescriptionInfoEntity;
  RequestImagesInfoEntity requestImagesInfoEntity;
  RequestInfoEntity({
    required this.id,
    required this.adminNote,
    required this.creatingDate,
    required this.requestDescriptionInfoEntity,
    required this.requestEconomicInfoEntity,
    required this.requestImagesInfoEntity,
    required this.requestStatus,
  });
  factory RequestInfoEntity.init() => RequestInfoEntity(
    id: -1,
    adminNote: '',
    creatingDate: '',
    requestDescriptionInfoEntity: RequestDescriptionInfoEntity.init(),
    requestEconomicInfoEntity: RequestEconomicInfoEntity.init(),
    requestImagesInfoEntity: RequestImagesInfoEntity.init(),
    requestStatus: '',
  );
  @override
  List<Object?> get props => [
    id,
    adminNote,
    requestStatus,
    creatingDate,
    requestEconomicInfoEntity,
    requestDescriptionInfoEntity,
    requestImagesInfoEntity,
  ];
}
