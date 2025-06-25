import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ViewPropertyRequestEntity extends Equatable {
  int id;
  String token;
  ViewPropertyRequestEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
