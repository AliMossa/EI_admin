import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ActiveUserEntity extends Equatable {
  int id;
  String token;
  ActiveUserEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
