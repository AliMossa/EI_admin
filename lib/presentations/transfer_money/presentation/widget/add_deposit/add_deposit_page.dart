import 'package:admin_dashboard/presentations/transfer_money/data/repository_imp/transfer_moeny_repository_imp.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/add_despoist_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/search_about_user_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/add_deposit/add_deposit_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/add_deposit/add_deposit_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDepositPage extends StatelessWidget {
  final TransferMoneyMiddleware _transferMoneyMiddleware =
      TransferMoneyMiddleware();
  AddDepositPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create:
          (context) => AddDepositBloc(
            transferMoneyMiddleware: _transferMoneyMiddleware,
            searchAboutUserUseCase: SearchAboutUserUseCase(
              transferMoenyRepository: TransferMoenyRepositoryImp(),
            ),
            addDespoistUseCase: AddDespoistUseCase(
              transferMoenyRepository: TransferMoenyRepositoryImp(),
            ),
          ),
      child: const AddDepositItem(),
    );
  }
}
