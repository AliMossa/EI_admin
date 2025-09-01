import 'package:admin_dashboard/presentations/transfer_money/data/repository_imp/transfer_moeny_repository_imp.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/tansfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/repository/transfer_money_repository.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/accept_transfer_money_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/reject_transfer_money_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/cubit/set_request_money_decision_cubit.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/view_transfer_money/view_transfer_money_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/view_transfer_request/view_transfer_request_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewTransferRequestPage extends StatelessWidget {
  TransferMoneyEntity transferMoneyEntity;
  final TransferMoneyMiddleware _transferMoneyMiddleware =
      TransferMoneyMiddleware();
  ViewTransferRequestPage({required this.transferMoneyEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => ViewTransferMoneyBloc(
                transferMoneyMiddleware: _transferMoneyMiddleware,
                acceptTransferMoneyUseCase: AcceptTransferMoneyUseCase(
                  transferMoenyRepository: TransferMoenyRepositoryImp(),
                ),
                rejectTransferMoneyUseCase: RejectTransferMoneyUseCase(
                  transferMoenyRepository: TransferMoenyRepositoryImp(),
                ),
              )..add(
                SetViewTransferMoneyEvent(
                  transfermoneyEntity: transferMoneyEntity,
                ),
              ),
        ),
        BlocProvider(
          create:
              (context) => SetRequestMoneyDecisionCubit(
                transferMoneyMiddleware: _transferMoneyMiddleware,
              ),
        ),
      ],
      child: const ViewTransferRequestItem(),
    );
  }
}
