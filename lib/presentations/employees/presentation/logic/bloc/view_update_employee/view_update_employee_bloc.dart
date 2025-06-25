import 'package:admin_dashboard/presentations/employees/domain/entities/active_user_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/update_employee_total_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/entities/view_entity_request_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/active_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/un_active_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/update_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/view_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'view_update_employee_event.dart';
part 'view_update_employee_state.dart';

class ViewUpdateEmployeeBloc
    extends Bloc<ViewUpdateEmployeeEvent, ViewUpdateEmployeeState> {
  ViewEmployeeUseCase viewEmployeeUseCase;
  ActiveEmployeeUseCase activeEmployeeUseCase;
  UnActiveEmployeeUseCase unActiveEmployeeUseCase;
  UpdateEmployeeUseCase updateEmployeeUseCase;
  EmployeesMiddleware employeesMiddleware;

  ViewUpdateEmployeeBloc({
    required this.updateEmployeeUseCase,
    required this.activeEmployeeUseCase,
    required this.unActiveEmployeeUseCase,
    required this.employeesMiddleware,
    required this.viewEmployeeUseCase,
  }) : super(ViewUpdateEmployeeInitial()) {
    on<ViewEmployeeEvent>(viewEmployees);
    on<ActiveEmployeeEvent>(activeEmployees);
    on<UnActiveEmployeeEvent>(unActiveEmployees);
    on<UpdateEmployeeEvent>(updateEmployees);
    on<UpdateEmployeeIdImageEvent>(updateIdImage);
  }

  void updateIdImage(
    UpdateEmployeeIdImageEvent event,
    Emitter<ViewUpdateEmployeeState> emit,
  ) {
    emit(LoadingUpdateEmployeeIdImage());
    emit(UpdateEmployeeIdImage());
  }

  void viewEmployees(
    ViewEmployeeEvent event,
    Emitter<ViewUpdateEmployeeState> emit,
  ) async {
    emit(LoadingViewEmployeesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await viewEmployeeUseCase(
        ViewEmployeeRequestEntity(token: token!, id: event.id),
      );
      response.fold(
        (failed) => emit(FailedViewEmployeesState(message: failed.message)),
        (success) async {
          employeesMiddleware.setViewEmployeeEntity(success);
          emit(SuccessViewEmployeesState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedViewEmployeesState(message: error.message));
    } catch (error) {
      emit(FailedViewEmployeesState(message: 'error'));
    }
  }

  void activeEmployees(
    ActiveEmployeeEvent event,
    Emitter<ViewUpdateEmployeeState> emit,
  ) async {
    emit(LoadingActiveEmployeesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await activeEmployeeUseCase(
        ActiveUserEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedActiveEmployeesState(message: failed.message)),
        (success) async {
          emit(SuccessActiveEmployeesState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedActiveEmployeesState(message: error.message));
    } catch (error) {
      emit(FailedActiveEmployeesState(message: 'error'));
    }
  }

  void unActiveEmployees(
    UnActiveEmployeeEvent event,
    Emitter<ViewUpdateEmployeeState> emit,
  ) async {
    emit(LoadingUnActiveEmployeesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await unActiveEmployeeUseCase(
        ActiveUserEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedUnActiveEmployeesState(message: failed.message)),
        (success) async {
          emit(SuccessUnActiveEmployeesState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedUnActiveEmployeesState(message: error.message));
    } catch (error) {
      emit(FailedUnActiveEmployeesState(message: 'error'));
    }
  }

  void updateEmployees(
    UpdateEmployeeEvent event,
    Emitter<ViewUpdateEmployeeState> emit,
  ) async {
    emit(LoadingUpdateEmployeesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await updateEmployeeUseCase(
        UpdateEmployeeTotalEntity(
          id: event.id,
          token: token!,
          updateEmployeeEntity: employeesMiddleware.getUpdatedEmployeeInfo(),
        ),
      );
      response.fold(
        (failed) => emit(FailedUpdateEmployeesState(message: failed.message)),
        (success) async {
          emit(SuccessUpdateEmployeesState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedUpdateEmployeesState(message: error.message));
    } catch (error) {
      print("error $error");

      emit(FailedUpdateEmployeesState(message: 'error'));
    }
  }
}
