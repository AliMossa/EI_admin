import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_personal_info_widget.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class AddEmployeeItems extends StatelessWidget {
  Size size;
  AddEmployeeItems({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [AddEmployeePersonalInfoWidget(size: size)]),
      ],
    );
  }
}
