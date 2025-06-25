import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class PropertyEntity extends Equatable {
  int id;
  String state;
  String exactPosition;

  PropertyEntity({
    required this.id,
    required this.state,
    required this.exactPosition,
  });
  @override
  List<Object?> get props => [id, state, exactPosition];
}
