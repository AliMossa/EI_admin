import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/employee_image_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/emplyees_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesPage extends StatelessWidget {
  final EmployeesMiddleware _employeesMiddleware = EmployeesMiddleware();
  EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  EmployeeImageCubit(employeesMiddleware: _employeesMiddleware),
        ),
        BlocProvider<KindsCubit>(
          create:
              (context) =>
                  KindsCubit(employeesMiddleware: _employeesMiddleware),
        ),
        BlocProvider<EmployeesBloc>(
          create:
              (context) =>
                  EmployeesBloc(employeesMiddleware: _employeesMiddleware),
        ),
      ],
      child: EmplyeesItem(),
    );
  }
}
