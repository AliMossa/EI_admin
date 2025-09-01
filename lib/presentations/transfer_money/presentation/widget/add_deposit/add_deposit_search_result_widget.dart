import 'package:admin_dashboard/presentations/public/public_widgets/desicion_text_form_field_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_variables_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/set_desicion_button_widget.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/about_user_entity.dart';
import 'package:admin_dashboard/util/validations/validations.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class AddDepositSearchResultWidget extends StatelessWidget {
  GlobalKey<FormState> globalKey;
  AboutUserEntity aboutUserEntity;
  Function onChange;
  Function() onPressed;
  Function(String?) onSubmiteed;
  Size size;
  AddDepositSearchResultWidget({
    required this.globalKey,
    required this.aboutUserEntity,
    required this.onChange,
    required this.onPressed,
    required this.onSubmiteed,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            PropertyVariablesWidget(
              title: 'name',
              value: aboutUserEntity.name,
              width: size.width * .15,
              textWidth: 100,
              height: 25,
              isMovible: true,
              size: size,
            ),
            PropertyVariablesWidget(
              title: 'phone',
              value: aboutUserEntity.phone,
              width: size.width * .15,
              textWidth: 100,
              height: 25,
              isMovible: true,
              size: size,
            ),
          ],
        ),
        Form(
          key: globalKey,
          child: DesicionTextFormFieldWidget(
            onSubmiteed: onSubmiteed,
            size: size,
            label: 'amount',
            onChange: onChange,
            validate: (value) => Validations.getAmountValidation(value),
          ),
        ),
        SetDesicionButtonWidget(
          size: size,
          onPress: onPressed,
          title: 'Activate',
        ),
      ],
    );
  }
}
