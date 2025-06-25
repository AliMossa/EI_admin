import 'package:admin_dashboard/presentations/employees/data/repository_source/employee_rempository_imp_source.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/active_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/un_active_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/update_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/view_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/bloc/view_update_employee/view_update_employee_bloc.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/active/active_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/logic/cubit/kinds_cubit.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/presentations/employees/presentation/widgets/view_employee/view_update_employee_item.dart';
import 'package:admin_dashboard/presentations/public/view_personal_image/logic/cubit/member_image_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewUpdateEmployeePage extends StatelessWidget {
  int id;
  final EmployeesMiddleware _employeesMiddleware = EmployeesMiddleware().get();
  ViewUpdateEmployeePage({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ViewUpdateEmployeeBloc>(
          create:
              (context) => ViewUpdateEmployeeBloc(
                updateEmployeeUseCase: UpdateEmployeeUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
                unActiveEmployeeUseCase: UnActiveEmployeeUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
                activeEmployeeUseCase: ActiveEmployeeUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
                employeesMiddleware: _employeesMiddleware,
                viewEmployeeUseCase: ViewEmployeeUseCase(
                  employeeRepository: EmployeeRempositoryImpSource(),
                ),
              )..add(ViewEmployeeEvent(id: id)),
        ),
        BlocProvider<MemberImageCubit>(create: (context) => MemberImageCubit()),
        BlocProvider<ActiveCubit>(
          create:
              (context) =>
                  ActiveCubit(employeesMiddleware: _employeesMiddleware),
        ),
        BlocProvider<KindsCubit>(
          create:
              (context) =>
                  KindsCubit(employeesMiddleware: _employeesMiddleware),
        ),
      ],
      child: ViewUpdateEmployeeItem(),
    );
  }
}
