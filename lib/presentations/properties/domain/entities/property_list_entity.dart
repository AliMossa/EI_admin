import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PropertyListEntity extends Equatable {
  String nextPage;
  List<PropertyRequestEntity> list;
  PropertyListEntity({required this.list, required this.nextPage});
  factory PropertyListEntity.init() =>
      PropertyListEntity(list: [], nextPage: '');
  @override
  List<Object?> get props => [list, nextPage];
}
