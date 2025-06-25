import 'package:admin_dashboard/presentations/employees/data/repository_source/employee_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/get_employees_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/re_get_employees_use_case.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_employees/employees_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/emplyees_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmployeesPage extends StatelessWidget {
  final EmployeesMiddleware _employeesMiddleware = EmployeesMiddleware().get();
  EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeesBloc>(
          create:
              (context) => EmployeesBloc(
                employeesMiddleware: _employeesMiddleware,
                reGetEmployeesUseCase: ReGetEmployeesUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
                getEmployeesUseCase: GetEmployeesUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
              )..add(GetEmployeesEvent()),
        ),
        BlocProvider(
          create:
              (context) =>
                  KindsCubit(employeesMiddleware: _employeesMiddleware),
        ),
      ],
      child: EmplyeesItem(),
    );
  }
}
