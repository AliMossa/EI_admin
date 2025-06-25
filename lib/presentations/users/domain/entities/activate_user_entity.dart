import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ActivateUserEntity extends Equatable {
  int id;
  String token;
  ActivateUserEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
