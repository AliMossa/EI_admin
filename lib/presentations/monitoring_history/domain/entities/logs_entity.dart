import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class LogsEntity extends Equatable {
  String message;
  String level;
  String time;
  LogsEntity({required this.message, required this.level, required this.time});

  @override
  List<Object?> get props => [message, level, time];
}
