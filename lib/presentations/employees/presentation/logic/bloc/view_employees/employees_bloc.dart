import 'package:admin_dashboard/presentations/employees/domain/entities/get_employees_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/get_employees_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/re_get_employees_use_case.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesMiddleware employeesMiddleware;
  GetEmployeesUseCase getEmployeesUseCase;
  ReGetEmployeesUseCase reGetEmployeesUseCase;
  EmployeesBloc({
    required this.employeesMiddleware,
    required this.getEmployeesUseCase,
    required this.reGetEmployeesUseCase,
  }) : super(EmployeesInitial()) {
    on<GetEmployeesEvent>(getEmployees);
  }

  void getEmployees(
    GetEmployeesEvent event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(LoadingGetEmployeesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getEmployeesUseCase(
        GetEmployeesRequestEntity(
          employeeKind: employeesMiddleware.getTeamKind() + 3,
          isAcive: employeesMiddleware.getTeamState(),
          token: token!,
        ),
      );
      response.fold(
        (failed) => emit(FailedGetEmployeesState(message: failed.message)),
        (success) {
          employeesMiddleware.tempList = success.employees;
          employeesMiddleware.setEmployees(success.employees);
          emit(SuccessGetEmployeesState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetEmployeesState(message: error.message));
    } catch (error) {
      emit(FailedGetEmployeesState(message: 'error'));
    }
  }

  void reGetEmployees(
    ReGetEmployeesEvent event,
    Emitter<EmployeesState> emit,
  ) async {
    emit(LoadingReGetEmployeesState());
    try {
      final response = await reGetEmployeesUseCase(event.link);
      response.fold(
        (failed) => emit(FailedReGetEmployeesState(message: failed.message)),
        (success) {
          emit(SuccessGetEmployeesState());

          employeesMiddleware.reSetEmployees(success);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetEmployeesState(message: error.message));
    } catch (error) {
      emit(FailedReGetEmployeesState(message: 'error'));
    }
  }
}
