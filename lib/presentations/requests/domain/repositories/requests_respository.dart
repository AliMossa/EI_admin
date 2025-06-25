import 'package:admin_dashboard/presentations/requests/domain/entities/request_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/send_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

abstract class RequestsRespository {
  Future<Either<AdminExceptions, TotalRequestEntity>> getAllRequests(
    String token,
  );
  Future<Either<AdminExceptions, TotalRequestEntity>> reGetAllRequests(
    String link,
  );
  Future<Either<AdminExceptions, RequestInfoEntity>> getRequestInfo(
    SendRequestEntity sendRequestEntity,
  );
  Future<Either<AdminExceptions, String>> acceptRequest(
    RequestManagmentEntity requestManagmentEntity,
  );
  Future<Either<AdminExceptions, String>> rejectRequest(
    RequestManagmentEntity requestManagmentEntity,
  );
}
