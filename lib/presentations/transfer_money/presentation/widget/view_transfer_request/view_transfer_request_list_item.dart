import 'package:admin_dashboard/presentations/public/public_widgets/property_variables_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/view_user_variable_widget.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/tansfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/cubit/set_request_money_decision_cubit.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/view_transfer_money/view_transfer_money_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/view_transfer_request/view_transfer_request_decision_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/flexible/flexible_method.dart';
import 'package:admin_dashboard/util/validations/validations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewTransferRequestListItem extends StatelessWidget {
  TransferMoneyEntity tansferMoneyEntity;
  Size size;
  ViewTransferRequestListItem({
    required this.tansferMoneyEntity,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ViewTransferMoneyBloc, ViewTransferMoneyState>(
      listener:
          (context, state) => context
              .read<ViewTransferMoneyBloc>()
              .transferMoneyMiddleware
              .getTransferMoneyRequestDesicionState(context, state),
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        width: size.width * .32,
        decoration: BoxDecoration(
          color: background,
          border: Border.all(color: textFieldBorder),
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              children: [
                PropertyVariablesWidget(
                  title: 'name',
                  value: tansferMoneyEntity.fullName,
                  width: size.width * .15,
                  textWidth: 100,
                  height: 25,
                  isMovible: true,
                  size: size,
                ),
                PropertyVariablesWidget(
                  title: 'phone',
                  value: tansferMoneyEntity.phone,
                  width: size.width * .15,
                  textWidth: 100,
                  height: 25,
                  isMovible: true,
                  size: size,
                ),
              ],
            ),
            Row(
              children: [
                PropertyVariablesWidget(
                  title: 'method',
                  value: tansferMoneyEntity.method,
                  width: size.width * .15,
                  textWidth: 100,
                  height: 25,
                  isMovible: true,
                  size: size,
                ),
                PropertyVariablesWidget(
                  title: 'amount',
                  value: tansferMoneyEntity.amount,
                  width: size.width * .15,
                  textWidth: 100,
                  height: 25,
                  isMovible: true,
                  size: size,
                ),
              ],
            ),
            if (tansferMoneyEntity.accountHolderName != null)
              Row(
                children: [
                  PropertyVariablesWidget(
                    title: 'account holder name',
                    value: tansferMoneyEntity.accountHolderName!,
                    width: size.width * .15,
                    textWidth: 100,
                    height: 25,
                    isMovible: true,
                    size: size,
                  ),
                  PropertyVariablesWidget(
                    title: 'card number',
                    value: tansferMoneyEntity.cardNumber!,
                    width: size.width * .15,
                    textWidth: 100,
                    height: 25,
                    isMovible: true,
                    size: size,
                  ),
                ],
              ),
            if (tansferMoneyEntity.walletAddress != null)
              PropertyVariablesWidget(
                title: 'wallet address',
                value: tansferMoneyEntity.walletAddress!,
                width: size.width * .3,
                textWidth: 200,
                height: 25,
                isMovible: true,
                size: size,
              ),
            PropertyVariablesWidget(
              title: 'created at',
              value: tansferMoneyEntity.createdAt,
              width: size.width * .3,
              textWidth: 200,
              height: 25,
              isMovible: true,
              size: size,
            ),
            ViewTransferRequestDecisionWidget(
              id: tansferMoneyEntity.id,
              currentValue:
                  context
                      .watch<SetRequestMoneyDecisionCubit>()
                      .transferMoneyMiddleware
                      .getSelectedTransferMoneyDecision(),
              size: size,
              title: 'decision',
              label: context
                  .watch<SetRequestMoneyDecisionCubit>()
                  .transferMoneyMiddleware
                  .getDecisionTitleText(
                    context
                        .watch<SetRequestMoneyDecisionCubit>()
                        .transferMoneyMiddleware
                        .getSelectedTransferMoneyDecision(),
                  ),
              onValidate: (value) => Validations.getnotesValidation(value),
              onChange:
                  (value) => context
                      .read<ViewTransferMoneyBloc>()
                      .transferMoneyMiddleware
                      .setTransferMoneyText(value),

              onPressed:
                  () => context
                      .read<ViewTransferMoneyBloc>()
                      .transferMoneyMiddleware
                      .sendCorrectTransferMoneyDecision(
                        context.read<ViewTransferMoneyBloc>(),
                        tansferMoneyEntity.id,
                      ),
              onSubmitted:
                  (_) => context
                      .read<ViewTransferMoneyBloc>()
                      .transferMoneyMiddleware
                      .sendCorrectTransferMoneyDecision(
                        context.read<ViewTransferMoneyBloc>(),
                        tansferMoneyEntity.id,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
