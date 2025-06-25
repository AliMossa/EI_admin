import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProfileLogsEntity extends Equatable {
  String message;
  String level;
  String time;
  ProfileLogsEntity({
    required this.message,
    required this.level,
    required this.time,
  });

  @override
  List<Object?> get props => [message, level, time];
}
