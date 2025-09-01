import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_drop_down_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_text_form_field_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/drop_down_desicion_model.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/set_desicion_button_widget.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/cubit/set_request_money_decision_cubit.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/view_transfer_money/view_transfer_money_bloc.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewTransferRequestDecisionWidget extends StatelessWidget {
  int id;
  int currentValue;
  String title;
  String label;
  Size size;
  Function onChange;
  Function onValidate;
  Function() onPressed;
  Function(String?) onSubmitted;

  ViewTransferRequestDecisionWidget({
    required this.id,
    required this.size,
    required this.currentValue,
    required this.title,
    required this.label,
    required this.onChange,
    required this.onValidate,
    required this.onPressed,
    required this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewTransferMoneyBloc, ViewTransferMoneyState>(
      builder: (context, state) {
        return ListView(
          shrinkWrap: true,
          children: [
            Row(
              children: [
                Text(title.toLowerCase(), style: getVariableTitleStyle(size)),
                DesicionDropDownWidget(
                  size: size,
                  kinds: DropDownDesicionModel().getDesicionMoneyRequestList(),
                  currntValue: currentValue,
                  onPressed:
                      (value) => context
                          .read<SetRequestMoneyDecisionCubit>()
                          .changeDecision(value),
                ),
                SizedBox(
                  width: size.width * .2,
                  child: DesicionTextFormFieldWidget(
                    onSubmiteed: onSubmitted,
                    onChange: onChange,
                    size: size,
                    label: label,
                    validate: (value) => onValidate(value),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            context
                .read<ViewTransferMoneyBloc>()
                .transferMoneyMiddleware
                .getTransferMoneyDecisionWidget(state, size)
                .fold(
                  (_) => SetDesicionButtonWidget(
                    size: size,
                    onPress: onPressed,
                    title: 'Activate',
                  ),
                  (widget) => widget,
                ),
          ],
        );
      },
    );
  }
}
