import 'package:admin_dashboard/presentations/employees/domain/entities/add_employee_entity.dart';
import 'package:admin_dashboard/presentations/employees/domain/use_cases/add_employee_use_case.dart';
import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_employee_event.dart';
part 'add_employee_state.dart';

class AddEmployeeBloc extends Bloc<AddEmployeeEvent, AddEmployeeState> {
  AddEmployeeUseCase addEmployeeUserCase;
  EmployeesMiddleware employeesMiddleware;

  AddEmployeeBloc({
    required this.addEmployeeUserCase,
    required this.employeesMiddleware,
  }) : super(AddEmployeeInitial()) {
    on<UpdateIdImagesEmployeesEvent>(addIdImage);
    on<RemoveIdImagesEmployeesEvent>(removeIdImage);
    on<AddNewEmployeeEvent>(addNewEmployee);
  }
  void addIdImage(
    UpdateIdImagesEmployeesEvent event,
    Emitter<AddEmployeeState> emit,
  ) {
    emit(LoadingUpdateIdImagesAddEmployeeState());
    emit(UpdateIdImagesAddEmployeeState());
  }

  void removeIdImage(
    RemoveIdImagesEmployeesEvent event,
    Emitter<AddEmployeeState> emit,
  ) {
    emit(LoadingRemoveIdImagesAddEmployeeState());
    emit(RemoveIdImagesAddEmployeeState());
  }

  void addNewEmployee(
    AddNewEmployeeEvent event,
    Emitter<AddEmployeeState> emit,
  ) async {
    emit(LoadingAddNewEmployeeState());
    try {
      final token = await SafeStorage.read('token');
      final response = await addEmployeeUserCase(
        AddEmployeeEntity(
          token: token!,
          employee: employeesMiddleware.getNewEmployeeInfo(),
        ),
      );
      response.fold(
        (failed) => emit(FailedAddNewEmployeeState(message: failed.message)),
        (success) {
          employeesMiddleware.resetImagesValues();
          emit(SuccessAddNewEmployeeState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedAddNewEmployeeState(message: error.message));
    }
  }
}
