import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class UserEntity extends Equatable {
  int id;
  String fullName;
  String email;
  String phone;
  String loggedIn;
  bool isActive;
  UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.loggedIn,
    this.isActive = false,
  });
  factory UserEntity.init() => UserEntity(
    id: -1,
    fullName: '',
    email: '',
    phone: '',
    loggedIn: '',
    isActive: false,
  );

  @override
  List<Object?> get props => [id, fullName, email, phone, loggedIn];
}
