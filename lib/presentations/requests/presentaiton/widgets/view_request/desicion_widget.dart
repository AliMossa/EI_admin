import 'package:admin_dashboard/presentations/requests/presentaiton/logic/request_info/request_info_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/cubit/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/drop_down_desicion_model.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_drop_down_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_text_form_field_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/set_desicion_button_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class DesicionWidget extends StatelessWidget {
  int id;
  int currentValue;
  String title;
  Size size;
  DesicionWidget({
    required this.id,
    required this.currentValue,
    required this.size,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: size.width * .4,
          padding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 10),
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: linkColor),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: Text(title, style: titleVariableContainerStyle),
              ),

              Row(
                children: [
                  Text(title.toLowerCase(), style: getVariableTitleStyle(size)),
                  DesicionDropDownWidget(
                    size: size,
                    kinds: DropDownDesicionModel().getDesicionList(),

                    currntValue: currentValue,
                    onPressed:
                        (value) =>
                            context.read<DesicionCubit>().changeDesicion(value),
                  ),
                ],
              ),
              if (context
                      .read<DesicionCubit>()
                      .requestMiddleware
                      .getDesicionValue() ==
                  1)
                DesicionTextFormFieldWidget(
                  onSubmiteed: (_) {},
                  label: 're-study note',
                  onChange:
                      (value) => context
                          .read<DesicionCubit>()
                          .requestMiddleware
                          .setAdminNotce(value),
                  size: size,
                  validate:
                      (value) => context
                          .read<DesicionCubit>()
                          .requestMiddleware
                          .getNameValidation(value),
                ),
              const SizedBox(height: 20),

              SetDesicionButtonWidget(
                size: size,
                onPress:
                    () => context
                        .read<RequestInfoBloc>()
                        .requestMiddleware
                        .sendAdminDesicion(context.read<RequestInfoBloc>(), id),
                title: 'Activate',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
