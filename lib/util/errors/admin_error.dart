import 'package:equatable/equatable.dart';

class AdminError extends Error {
  String message;
  AdminError({required this.message});

  @override
  List<Object?> get props => [message];
}

// ignore: must_be_immutable
class ServerAdminError extends AdminError {
  ServerAdminError({required super.message});
}

// ignore: must_be_immutable
class ClientAdminError extends AdminError {
  ClientAdminError({required super.message});
}
