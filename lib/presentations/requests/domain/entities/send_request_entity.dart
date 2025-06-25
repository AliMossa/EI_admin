import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SendRequestEntity extends Equatable {
  int id;
  String token;
  SendRequestEntity({required this.id, required this.token});

  @override
  List<Object?> get props => [id, token];
}
