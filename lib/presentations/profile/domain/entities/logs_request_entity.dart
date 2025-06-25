import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LogsRequestEntity extends Equatable {
  int id;
  String token;
  LogsRequestEntity({required this.id, required this.token});
  @override
  List<Object?> get props => [id, token];
}
