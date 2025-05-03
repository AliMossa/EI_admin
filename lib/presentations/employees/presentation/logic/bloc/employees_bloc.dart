import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employees_event.dart';
part 'employees_state.dart';

class EmployeesBloc extends Bloc<EmployeesEvent, EmployeesState> {
  EmployeesMiddleware employeesMiddleware;
  EmployeesBloc({required this.employeesMiddleware})
    : super(EmployeesInitial()) {
    on<EmployeesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
