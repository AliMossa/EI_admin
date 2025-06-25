import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestManagmentEntity extends Equatable {
  int id;
  String token;
  String? notice;
  RequestManagmentEntity({required this.id, required this.token, this.notice});

  @override
  List<Object?> get props => [id, token];
}
