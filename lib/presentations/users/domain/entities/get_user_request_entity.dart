import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class GetUserRequestEntity extends Equatable {
  int active;
  String token;
  GetUserRequestEntity({required this.active, required this.token});

  @override
  List<Object?> get props => [active, token];
}
