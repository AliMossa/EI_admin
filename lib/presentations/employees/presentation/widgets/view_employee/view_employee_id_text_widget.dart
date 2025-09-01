import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewEmployeeIdTextWidget extends StatelessWidget {
  int id;
  Size size;
  double widthSizeFactor;
  ViewEmployeeIdTextWidget({
    required this.widthSizeFactor,
    required this.size,
    required this.id,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUpdateEmployeeBloc, ViewUpdateEmployeeState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Id', style: getVariableTitleStyle(size)),
            Container(
              width: size.width * widthSizeFactor,
              height: 40,
              padding: EdgeInsets.only(left: 5, right: 5, top: 10),
              margin: EdgeInsets.only(left: 20, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: linkColor),
                color: textFieldInside,
              ),
              child: Text(
                id.toString(),
                style: getProfileTitleLogginDateStyle(size),
              ),
            ),
          ],
        );
      },
    );
  }
}
