import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/add_deposit/add_deposit_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/add_deposit/add_deposit_search_bar_widget.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/widget/add_deposit/add_deposit_search_result_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/validations/validations.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddDepositListItem extends StatelessWidget {
  Size size;
  AddDepositListItem({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddDepositBloc, AddDepositState>(
      builder: (context, state) {
        return Container(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: size.width * .32,
          // height: size.height * .35,
          decoration: BoxDecoration(
            color: background,
            border: Border.all(color: textFieldBorder),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              AddDepositSearchBarWidget(
                size: size,
                onChange:
                    (value) => context
                        .read<AddDepositBloc>()
                        .transferMoneyMiddleware
                        .setSearchAboutUserText(value),
                onSubmitted:
                    (_) => context.read<AddDepositBloc>().add(
                      SearchAboutUserEvent(),
                    ),
                onValidate: (value) => Validations.getEmailVaidation(value),
                onPressed:
                    () => context.read<AddDepositBloc>().add(
                      SearchAboutUserEvent(),
                    ),
              ),
              context
                  .watch<AddDepositBloc>()
                  .transferMoneyMiddleware
                  .getSearchAboutUserWidget(state)
                  .fold(
                    (_) => AddDepositSearchResultWidget(
                      globalKey:
                          context
                              .read<AddDepositBloc>()
                              .transferMoneyMiddleware
                              .getGlobalFromKey(),
                      onPressed:
                          () => context
                              .read<AddDepositBloc>()
                              .transferMoneyMiddleware
                              .sendAddDeposit(
                                context.read<AddDepositBloc>(),
                                context
                                    .read<AddDepositBloc>()
                                    .transferMoneyMiddleware
                                    .getAboutUserEntity()
                                    .userId,
                              ),
                      onSubmiteed:
                          (_) => context
                              .read<AddDepositBloc>()
                              .transferMoneyMiddleware
                              .sendAddDeposit(
                                context.read<AddDepositBloc>(),
                                context
                                    .read<AddDepositBloc>()
                                    .transferMoneyMiddleware
                                    .getAboutUserEntity()
                                    .userId,
                              ),
                      onChange:
                          (value) => context
                              .read<AddDepositBloc>()
                              .transferMoneyMiddleware
                              .setDepositAmount(int.parse(value)),
                      size: size,
                      aboutUserEntity:
                          context
                              .watch<AddDepositBloc>()
                              .transferMoneyMiddleware
                              .getAboutUserEntity(),
                    ),
                    (widget) => widget,
                  ),
            ],
          ),
        );
      },
      listener:
          (BuildContext context, AddDepositState state) => context
              .read<AddDepositBloc>()
              .transferMoneyMiddleware
              .getAddDecisionState(context, state),
    );
  }
}
