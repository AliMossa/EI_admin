import 'package:admin_dashboard/presentations/users/data/data_sources/activate_user_data_source.dart';
import 'package:admin_dashboard/presentations/users/data/data_sources/add_user_data_source.dart';
import 'package:admin_dashboard/presentations/users/data/data_sources/get_user_info_data_source.dart';
import 'package:admin_dashboard/presentations/users/data/data_sources/get_users_data_source.dart';
import 'package:admin_dashboard/presentations/users/data/data_sources/re_get_uses_data_source.dart';
import 'package:admin_dashboard/presentations/users/data/data_sources/un_active_user_data_srouce.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/activate_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/add_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/get_user_info_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/get_user_request_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/repositories/user_repository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImp implements UserRepository {
  @override
  Future<Either<AdminExceptions, String>> addUser(
    AddUserEntity userEntity,
  ) async {
    try {
      return right(await AddUserDataSourceWithDio().get().addUser(userEntity));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalUserEntity>> getUsers(
    GetUserRequestEntity getUserRequestEntity,
  ) async {
    try {
      return right(
        await GetUsersDataSourceWithDio().get().getUsers(getUserRequestEntity),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, UserEntity>> getUserInfo(
    GetUserInfoRequestEntity getUserInfoRequestEntity,
  ) async {
    try {
      return right(
        await GetUserInfoDataSourceWithDio().get().getUserInfo(
          getUserInfoRequestEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> activeUser(
    ActivateUserEntity activateUserEntity,
  ) async {
    try {
      return right(
        await ActivateUserDataSourceWithDio().get().activateUser(
          activateUserEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> unActiveUser(
    ActivateUserEntity activateUserEntity,
  ) async {
    try {
      return right(
        await UnActiveUserDataSrouceWithDio().get().unActivateUser(
          activateUserEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalUserEntity>> reGetUserInfo(
    String link,
  ) async {
    try {
      return right(await ReGetUsesDataSourceWithDio().get().reGetUsers(link));
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
