import 'package:admin_dashboard/presentations/requests/domain/entities/request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';

abstract class ReGetAllRequestsDataSrouce {
  Future<TotalRequestEntity> reGetAllRequests(String link);
}

class ReGetAllRequestsDataSrouceWithDio extends ReGetAllRequestsDataSrouce {
  ReGetAllRequestsDataSrouceWithDio? _reGetAllRequestsDataSrouceWithDio;
  ReGetAllRequestsDataSrouceWithDio get() =>
      _reGetAllRequestsDataSrouceWithDio ??
      (_reGetAllRequestsDataSrouceWithDio =
          ReGetAllRequestsDataSrouceWithDio());

  @override
  Future<TotalRequestEntity> reGetAllRequests(String link) async {
    String message = '';
    List<RequestEntity> requests = [];
    try {
      final response = await Apis().get(link, {}, '');
      if (response['errors'] == null) {
        message = response['message'];
      } else {
        message = response['message'] ?? response['errors'];
        throw Exception();
      }
      for (Map<String, dynamic> item in response['data']) {
        requests.add(
          RequestEntity(
            id: item['id'],
            economicEvaluationId: item['economic_evaluation_id'],
            adminNote: item['note_admin'] ?? 'l',
            status: item['status'],
            createdAt: item['created_at'],
            expertTeamTimeAcceptance: item['expert_acceptance_date'],
            lawyerTimeAcceptance: item['lawyer_acceptance_date'],
          ),
        );
      }
      return TotalRequestEntity(nextPage: '', requests: requests);
    } on ClientAdminError catch (error) {
      throw ServerAdminError(message: error.message);
    } catch (error) {
      throw ServerAdminError(message: message);
    }
  }
}
