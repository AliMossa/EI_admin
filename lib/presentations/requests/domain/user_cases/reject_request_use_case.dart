import 'package:admin_dashboard/presentations/requests/domain/entities/request_managment_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/repositories/requests_respository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class RejectRequestUseCase {
  RequestsRespository requestsRespository;
  RejectRequestUseCase({required this.requestsRespository});

  Future<Either<AdminExceptions, String>> call(
    RequestManagmentEntity requestManagmentEntity,
  ) async {
    return await requestsRespository.rejectRequest(requestManagmentEntity);
  }
}
