import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/add_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/get_user_info_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/get_user_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<AdminExceptions, String>> addUser(AddUserEntity userEntity);
  Future<Either<AdminExceptions, TotalUserEntity>> getUsers(
    GetUserRequestEntity getUserRequestEntity,
  );
  Future<Either<AdminExceptions, TotalUserEntity>> reGetUserInfo(String link);

  Future<Either<AdminExceptions, UserEntity>> getUserInfo(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  );
  Future<Either<AdminExceptions, String>> activeUser(
    ActivateUserEntity activateUserEntity,
  );
  Future<Either<AdminExceptions, String>> unActiveUser(
    ActivateUserEntity activateUserEntity,
  );
}
