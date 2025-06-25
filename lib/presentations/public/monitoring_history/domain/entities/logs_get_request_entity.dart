import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LogsGetRequestEntity extends Equatable {
  int id;
  String token;
  LogsGetRequestEntity({required this.id, required this.token});
  @override
  List<Object?> get props => [id, token];
}
