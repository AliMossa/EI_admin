import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'transfer_type_event.dart';
part 'transfer_type_state.dart';

class TransferTypeBloc extends Bloc<TransferTypeEvent, TransferTypeState> {
  final TransferMoneyMiddleware transferMoneyMiddleware;

  TransferTypeBloc({required this.transferMoneyMiddleware})
    : super(TransferTypeInitial()) {
    on<ChangeTransferTypeEvent>(changeTransferType);
  }

  void changeTransferType(
    ChangeTransferTypeEvent event,
    Emitter<TransferTypeState> emit,
  ) {
    emit(LoadingChangeTransferTypeState());
    transferMoneyMiddleware.set(event.type);
    emit(ChangeTransferTypeState());
  }
}
