import 'package:equatable/equatable.dart';

class ChangePasswordEntity extends Equatable {
  String email;
  String password;
  String confirmPassword;
  ChangePasswordEntity({
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  @override
  List<Object?> get props => [email, password, confirmPassword];
}
