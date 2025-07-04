import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_drop_down_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/drop_down_desicion_model.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/set_desicion_button_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewPropertyDesicionWidget extends StatelessWidget {
  int id;
  int currentValue;
  String title;
  Size size;
  ViewPropertyDesicionWidget({
    required this.id,
    required this.size,
    required this.currentValue,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewPropertyBloc, ViewPropertyState>(
      builder: (context, state) {
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
                      Text(
                        title.toLowerCase(),
                        style: getVariableTitleStyle(size),
                      ),
                      DesicionDropDownWidget(
                        size: size,
                        kinds:
                            DropDownDesicionModel().getPropertyDesicionList(),

                        currntValue: currentValue,
                        onPressed:
                            (value) => context
                                .read<DesicionCubit>()
                                .setCurrentValue(value),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  (state is LoadingNewPropertyStudyState ||
                          state is LoadingSetPropertySoldState)
                      ? LoadingWidget()
                      : SetDesicionButtonWidget(
                        size: size,
                        onPress:
                            () => context
                                .read<ViewPropertyBloc>()
                                .propertiesMiddlewar
                                .sendPropertyDesicion(
                                  context.read<ViewPropertyBloc>(),
                                  id,
                                ),
                        title: 'Activate',
                      ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
