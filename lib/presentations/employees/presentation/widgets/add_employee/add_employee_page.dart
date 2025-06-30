import 'package:admin_dashboard/presentations/employees/data/repository_source/employee_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/add_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/add_employee/add_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/date/date_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/add_employee/add_employee_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmployeePage extends StatelessWidget {
  final EmployeesMiddleware _employeesMiddleware = EmployeesMiddleware().get();
  AddEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AddEmployeeBloc>(
          create:
              (context) => AddEmployeeBloc(
                employeesMiddleware: _employeesMiddleware,
                addEmployeeUserCase: AddEmployeeUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
              ),
        ),
        BlocProvider(create: (context) => DateCubit()),

        BlocProvider<KindsCubit>(
          create:
              (context) =>
                  KindsCubit(employeesMiddleware: _employeesMiddleware),
        ),
      ],
      child: AddEmployeeItems(),
    );
  }
}
