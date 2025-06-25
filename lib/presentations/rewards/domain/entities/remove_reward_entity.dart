import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RemoveRewardEntity extends Equatable {
  int id;
  String token;
  RemoveRewardEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
