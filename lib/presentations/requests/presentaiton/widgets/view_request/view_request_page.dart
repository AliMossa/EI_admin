import 'package:admin_dashboard/presentations/requests/data/repositories_imp_source/requests_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/accept_request_use_case.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/get_request_info_use_case.dart';
import 'package:admin_dashboard/presentations/requests/domain/user_cases/reject_request_use_case.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/request_info/request_info_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/cubit/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/middleware/request_middleware.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/view_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewRequestPage extends StatelessWidget {
  int id;
  final RequestMiddleware _requestMiddleware = RequestMiddleware();
  ViewRequestPage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DesicionCubit>(
          create:
              (context) => DesicionCubit(requestMiddleware: _requestMiddleware),
        ),
        BlocProvider(
          create:
              (context) => RequestInfoBloc(
                acceptRequestUseCase: AcceptRequestUseCase(
                  requestsRespository: RequestsRepositoryImpSource(),
                ),
                rejectRequestUseCase: RejectRequestUseCase(
                  requestsRespository: RequestsRepositoryImpSource(),
                ),
                requestMiddleware: _requestMiddleware,
                getRequestInfoUseCase: GetRequestInfoUseCase(
                  requestsRepository: RequestsRepositoryImpSource(),
                ),
              )..add(ViewRequestInfoEvent(id: id)),
        ),
      ],
      child: ViewRequestItem(),
    );
  }
}
