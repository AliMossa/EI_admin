import 'package:admin_dashboard/presentations/employees/presentation/widgets/employee_item_status_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee_info_button_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EmployeeItemWidget extends StatelessWidget {
  Size size;
  String name;
  String status;
  String date;
  EmployeeItemWidget({
    required this.size,
    required this.name,
    required this.status,
    required this.date,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: linkColor),
        gradient: mainGradient2,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        title: Text(name, style: profileTitleLogginDateStyle),
        trailing: ViewEmployeeInfoButtonWidget(),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: size.width * .15,
              height: size.height * .028,
              child: EmployeeItemStatusWidget(
                size: size,
                status: status,
                date: date,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
