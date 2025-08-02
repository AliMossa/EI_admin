import 'package:admin_dashboard/presentations/requests/data/data_sources/accept_request_data_source.dart';
import 'package:admin_dashboard/presentations/requests/data/data_sources/get_all_requests_data_srouce.dart';
import 'package:admin_dashboard/presentations/requests/data/data_sources/get_request_info_data_srource.dart';
import 'package:admin_dashboard/presentations/requests/data/data_sources/re_get_all_requests_data_srouce.dart';
import 'package:admin_dashboard/presentations/requests/data/data_sources/reject_request_data_source.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/send_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/repositories/requests_respository.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class RequestsRepositoryImpSource implements RequestsRespository {
  @override
  Future<Either<AdminExceptions, TotalRequestEntity>> getAllRequests(
    String token,
  ) async {
    try {
      return right(
        await GetAllRequestsDataSrouceWithDio().getAllRequests(token),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, RequestInfoEntity>> getRequestInfo(
    SendRequestEntity sendRequestEntity,
  ) async {
    try {
      return right(
        await GetRequestInfoDataSrourceWithDio().getRequestInfo(
          sendRequestEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> acceptRequest(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    try {
      return right(
        await AcceptRequestDataSourceWithDio().acceptRequest(
          requestManagmentEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, String>> rejectRequest(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    try {
      return right(
        await RejectRequestDataSourceWithDio().rejectRequest(
          requestManagmentEntity,
        ),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }

  @override
  Future<Either<AdminExceptions, TotalRequestEntity>> reGetAllRequests(
    String link,
  ) async {
    try {
      return right(
        await ReGetAllRequestsDataSrouceWithDio().reGetAllRequests(link),
      );
    } on ServerAdminError catch (error) {
      return left(ServerAdminException(message: error.message));
    }
  }
}
