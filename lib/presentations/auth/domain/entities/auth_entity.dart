import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AuthEntity extends Equatable {
  String email;
  String password;
  AuthEntity({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

// ignore: must_be_immutable
class ResponseAuthEntity extends Equatable {
  String token;
  String message;

  ResponseAuthEntity({required this.message, required this.token});

  @override
  List<Object?> get props => [message, token];
}
