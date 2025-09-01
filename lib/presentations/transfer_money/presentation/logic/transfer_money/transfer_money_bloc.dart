import 'dart:developer';

import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_request_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/get_transfer_money_requests_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_money_event.dart';
part 'transfer_money_state.dart';

class TransferMoneyBloc extends Bloc<TransferMoneyEvent, TransferMoneyState> {
  final TransferMoneyMiddleware transferMoneyMiddleware;
  final GetTransferMoneyRequestsUseCase getTransferMoneyRequestsUseCase;
  TransferMoneyBloc({
    required this.transferMoneyMiddleware,
    required this.getTransferMoneyRequestsUseCase,
  }) : super(TransferMoneyInitial()) {
    on<GetTransferMoneyRequestsEvent>(getTransferMoneyList);
  }

  void getTransferMoneyList(
    GetTransferMoneyRequestsEvent event,
    Emitter<TransferMoneyState> emit,
  ) async {
    emit(LoadingGetTransferMoneyRequestsState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getTransferMoneyRequestsUseCase(
        TransferMoneyRequestEntity(
          token: token!,
          type: transferMoneyMiddleware.getTransferType(),
        ),
      );
      response.fold(
        (failed) =>
            emit(FailedGetTransferMoneyRequestsState(message: failed.message)),
        (success) {
          transferMoneyMiddleware.tempRequests = success.requests;
          emit(SuccessGetTransferMoneyRequestsState());
          transferMoneyMiddleware.setTransferMoneyListEntity(success);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetTransferMoneyRequestsState(message: error.message));
    } catch (error, stackTrace) {
      log(
        'Unhandled Exception: $error',
        stackTrace: stackTrace,
        name: 'ActiveEmployee',
      );
      emit(FailedGetTransferMoneyRequestsState(message: 'error'));
    }
  }
}
