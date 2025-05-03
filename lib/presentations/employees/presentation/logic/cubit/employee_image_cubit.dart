import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'employee_image_state.dart';

class EmployeeImageCubit extends Cubit<EmployeeImageState> {
  EmployeesMiddleware employeesMiddleware;
  EmployeeImageCubit({required this.employeesMiddleware})
    : super(EmployeeImageInitial());

  void hover() => emit(HoverEmployeeImageState());
  void endHover() => emit(EndHoverEmployeeImageState());
}
