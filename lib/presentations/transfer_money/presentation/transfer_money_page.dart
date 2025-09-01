import 'package:admin_dashboard/presentations/transfer_money/data/repository_imp/transfer_moeny_repository_imp.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/get_transfer_money_requests_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_type/transfer_type_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_money/transfer_money_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/transfer_money_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransferMoneyPage extends StatelessWidget {
  final TransferMoneyMiddleware _transferMoneyMiddleware =
      TransferMoneyMiddleware();
  TransferMoneyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) => TransferMoneyBloc(
                transferMoneyMiddleware: _transferMoneyMiddleware,
                getTransferMoneyRequestsUseCase:
                    GetTransferMoneyRequestsUseCase(
                      transferMoneyRepository: TransferMoenyRepositoryImp(),
                    ),
              )..add(GetTransferMoneyRequestsEvent()),
        ),
        BlocProvider(
          create:
              (context) => TransferTypeBloc(
                transferMoneyMiddleware: _transferMoneyMiddleware,
              ),
        ),
      ],
      child: const TransferMoneyItem(),
    );
  }
}
