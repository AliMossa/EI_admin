import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TotalUserEntity extends Equatable {
  String nextPage;
  List<UserEntity> users;
  TotalUserEntity({required this.nextPage, required this.users});
  factory TotalUserEntity.init() => TotalUserEntity(
    nextPage: '',
    users: [
      UserEntity(id: -1, fullName: '', email: '', phone: '', loggedIn: ''),
    ],
  );
  @override
  List<Object?> get props => [nextPage, users];
}
