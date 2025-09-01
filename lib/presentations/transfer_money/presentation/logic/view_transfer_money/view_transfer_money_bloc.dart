import 'package:admin_dashboard/presentations/transfer_money/domain/entities/accept_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/reject_transfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/tansfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/accept_transfer_money_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/reject_transfer_money_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_transfer_money_event.dart';
part 'view_transfer_money_state.dart';

class ViewTransferMoneyBloc
    extends Bloc<ViewTransferMoneyEvent, ViewTransferMoneyState> {
  final TransferMoneyMiddleware transferMoneyMiddleware;
  final AcceptTransferMoneyUseCase acceptTransferMoneyUseCase;
  final RejectTransferMoneyUseCase rejectTransferMoneyUseCase;
  ViewTransferMoneyBloc({
    required this.acceptTransferMoneyUseCase,
    required this.rejectTransferMoneyUseCase,
    required this.transferMoneyMiddleware,
  }) : super(ViewTransferMoneyInitial()) {
    on<SetViewTransferMoneyEvent>(setViewTransferMoney);
    on<AcceptTransferMoneyRequestEvent>(acceptTransferMoneyRequest);
    on<RejectTransferMoneyRequestEvent>(rejectTransferMoneyRequest);
  }

  void setViewTransferMoney(
    SetViewTransferMoneyEvent event,
    Emitter<ViewTransferMoneyState> emit,
  ) async {
    transferMoneyMiddleware.setTransferMoneyEntity(event.transfermoneyEntity);
    emit(SetViewTransferMoneyState());
  }

  void rejectTransferMoneyRequest(
    RejectTransferMoneyRequestEvent event,
    Emitter<ViewTransferMoneyState> emit,
  ) async {
    emit(LoadingRejectTransferMoneyRequestEvent());
    try {
      final token = await SafeStorage.read('token');
      final response = await rejectTransferMoneyUseCase(
        RejectTransferMoneyEntity(
          id: event.transferMoneyRequestId,
          notes: transferMoneyMiddleware.getTransferMoneyText(),
          token: token!,
        ),
      );
      response.fold(
        (failed) => emit(
          FailedRejectTransferMoneyRequestEvent(message: failed.message),
        ),
        (success) => emit(SuccessRejectTransferMoneyRequestEvent()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedRejectTransferMoneyRequestEvent(message: error.message));
    }
  }

  void acceptTransferMoneyRequest(
    AcceptTransferMoneyRequestEvent event,
    Emitter<ViewTransferMoneyState> emit,
  ) async {
    emit(LoadingAcceptTransferMoneyRequestEvent());
    try {
      final token = await SafeStorage.read('token');

      final response = await acceptTransferMoneyUseCase(
        AcceptTransferMoneyEntity(
          id: event.transferMoneyRequestId,
          transactionReference: transferMoneyMiddleware.getTransferMoneyText(),
          token: token!,
        ),
      );
      response.fold(
        (failed) => emit(
          FailedAcceptTransferMoneyRequestEvent(message: failed.message),
        ),
        (success) => emit(SuccessAcceptTransferMoneyRequestEvent()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedAcceptTransferMoneyRequestEvent(message: error.message));
    }
  }
}
