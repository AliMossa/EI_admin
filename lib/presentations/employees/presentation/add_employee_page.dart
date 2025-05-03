import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee_items.dart';
import 'package:flutter/widgets.dart';

class AddEmployeePage extends StatelessWidget {
  const AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return AddEmployeeItems(size: moreInfo);
  }
}
