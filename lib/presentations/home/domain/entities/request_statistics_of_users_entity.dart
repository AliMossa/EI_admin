import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class RequestStatisticsOfUsersEntity extends Equatable {
  String token;
  RequestStatisticsOfUsersEntity({required this.token});

  @override
  List<Object?> get props => [token];
}
