class AdminExceptions implements Exception {
  String message;
  AdminExceptions({required this.message});
}

class ServerAdminException extends AdminExceptions {
  ServerAdminException({required super.message});
}

class ClientAdminException extends AdminExceptions {
  ClientAdminException({required super.message});
}
