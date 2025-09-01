import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'set_request_money_decision_state.dart';

class SetRequestMoneyDecisionCubit extends Cubit<SetRequestMoneyDecisionState> {
  final TransferMoneyMiddleware transferMoneyMiddleware;
  SetRequestMoneyDecisionCubit({required this.transferMoneyMiddleware})
    : super(SetRequestMoneyDecisionInitial());

  void changeDecision(int decision) {
    emit(LoadingChangeRequestMoneyDecisionState());
    transferMoneyMiddleware.setSelectedTransferMoneyDecision(decision);
    emit(ChangeRequestMoneyDecisionState());
  }
}
