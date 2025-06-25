import 'package:admin_dashboard/presentations/requests/domain/entities/request_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/send_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/repositories/requests_respository.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:dartz/dartz.dart';

class GetRequestInfoUseCase {
  RequestsRespository requestsRepository;
  GetRequestInfoUseCase({required this.requestsRepository});

  Future<Either<AdminExceptions, RequestInfoEntity>> call(
    SendRequestEntity sendRequestEntity,
  ) async {
    return await requestsRepository.getRequestInfo(sendRequestEntity);
  }
}
