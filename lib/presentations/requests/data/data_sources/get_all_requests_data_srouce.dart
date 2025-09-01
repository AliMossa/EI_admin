import 'dart:developer';

import 'package:admin_dashboard/presentations/requests/domain/entities/request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/util/apis/apis.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/errors/admin_error.dart';
import 'package:admin_dashboard/util/notices/show_notices.dart';
import 'package:dio/dio.dart';

abstract class GetAllRequestsDataSrouce {
  Future<TotalRequestEntity> getAllRequests(String token);
}

class GetAllRequestsDataSrouceWithDio extends GetAllRequestsDataSrouce {
  @override
  Future<TotalRequestEntity> getAllRequests(String token) async {
    String message = '';
    List<RequestEntity> requests = [];
    try {
      final response = await Apis().get(
        NetworkApisRouts().getAllRequestsApi(),
        {},
        token,
      );
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
      return TotalRequestEntity(requests: requests, nextPage: '');
    } on ClientAdminError catch (error) {
      log('ClientAdminError: ${error.message}', name: 'GetAllRequests');
      throw ServerAdminError(message: error.message);
    } on DioException catch (dioError) {
      log('DioException: ${dioError.message}', name: 'GetAllRequests');
      throw ServerAdminError(message: ShowNotices.internetError);
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'GetAllRequests',
      );
      throw ServerAdminError(
        message: message.isEmpty ? ShowNotices.abnormalError : message,
      );
    }
  }
}
