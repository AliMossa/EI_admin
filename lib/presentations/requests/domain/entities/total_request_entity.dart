import 'package:admin_dashboard/presentations/requests/domain/entities/request_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalRequestEntity extends Equatable {
  String nextPage;
  List<RequestEntity> requests;
  TotalRequestEntity({required this.nextPage, required this.requests});
  factory TotalRequestEntity.init() =>
      TotalRequestEntity(nextPage: '', requests: []);
  @override
  List<Object?> get props => [nextPage, requests];
}
