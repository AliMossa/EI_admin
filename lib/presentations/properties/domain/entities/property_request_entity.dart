import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PropertyRequestEntity extends Equatable {
  int id;
  String location;
  String propertyType;
  String? totalInvested;
  String? progressPercent;
  String? isCompleted;
  PropertyRequestEntity({
    required this.id,
    required this.location,
    required this.propertyType,
    this.totalInvested = '',
    this.progressPercent = '',
    this.isCompleted = '',
  });

  @override
  List<Object?> get props => [id, location, propertyType];
}
