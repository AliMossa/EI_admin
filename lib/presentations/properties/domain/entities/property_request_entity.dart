import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PropertyRequestEntity extends Equatable {
  int id;
  String location;
  String propertyType;
  PropertyRequestEntity({
    required this.id,
    required this.location,
    required this.propertyType,
  });

  @override
  List<Object?> get props => [id, location, propertyType];
}
