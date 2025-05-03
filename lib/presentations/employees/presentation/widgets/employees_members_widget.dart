import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_button_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/employee_item_widget.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_kinds_menus_widget.dart';
import 'package:flutter/widgets.dart';

class EmployeesMembersWidget extends StatelessWidget {
  const EmployeesMembersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ViewKindsMenusWidget(
              activeList: ['Active', 'non Active'],
              teamKindList: ['Expert team', 'Lawyer team'],
            ),
            SizedBox(
              height: moreInfo.height * .75,
              width: moreInfo.width * .8,

              child: ListView.builder(
                itemCount: 20,
                itemBuilder:
                    (context, index) => EmployeeItemWidget(
                      date: '2:20 pm 2-2-2025',
                      name: 'Ali Emad Mossa',
                      size: moreInfo,
                      status: 'logged in',
                    ),
              ),
            ),
          ],
        ),
        AddEmployeeButtonWidget(),
      ],
    );
  }
}
