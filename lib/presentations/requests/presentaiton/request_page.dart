import 'package:admin_dashboard/presentations/requests/data/repositories_imp_source/requests_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/get_all_requests_use_case.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/re_get_all_requests_use_case.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/requests/requests_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/middleware/request_middleware.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/request_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestPage extends StatelessWidget {
  final RequestMiddleware _requestMiddleware = RequestMiddleware();
  RequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => RequestsBloc(
            requestMiddleware: _requestMiddleware,
            reGetAllRequestsUseCase: ReGetAllRequestsUseCase(
              requestsRespository: RequestsRepositoryImpSource(),
            ),
            getAllRequestsUseCase: GetAllRequestsUseCase(
              requestsRespository: RequestsRepositoryImpSource(),
            ),
          )..add(GetAllRequestsEvent()),
      child: RequestItems(),
    );
  }
}
