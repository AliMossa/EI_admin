import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ViewEmployeeRequestEntity extends Equatable {
  int id;
  String token;
  ViewEmployeeRequestEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
