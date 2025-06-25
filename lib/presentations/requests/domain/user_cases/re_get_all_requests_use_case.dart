import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/repositories/requests_respository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class ReGetAllRequestsUseCase {
  RequestsRespository requestsRespository;
  ReGetAllRequestsUseCase({required this.requestsRespository});
  Future<Either<AdminExceptions, TotalRequestEntity>> call(String link) async {
    return await requestsRespository.reGetAllRequests(link);
  }
}
