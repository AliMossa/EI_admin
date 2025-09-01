import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AboutUserEntity extends Equatable {
  int userId;
  String name;
  String phone;
  String email;
  AboutUserEntity({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
  });
  factory AboutUserEntity.init() =>
      AboutUserEntity(userId: -1, name: '', email: '', phone: '');
  @override
  List<Object?> get props => [userId, name, phone, email];
}
