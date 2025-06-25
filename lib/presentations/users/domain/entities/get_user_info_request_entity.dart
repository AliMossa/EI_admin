import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GetUserInfoRequestEntity extends Equatable {
  int id;
  String token;
  GetUserInfoRequestEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
