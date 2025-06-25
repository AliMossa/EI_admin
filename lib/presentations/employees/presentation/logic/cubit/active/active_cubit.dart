import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:admin_dashboard/presentations/public/active_switch/middleware/active_switch_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_state.dart';

class ActiveCubit extends Cubit<ActiveState> {
  EmployeesMiddleware employeesMiddleware;
  ActiveCubit({required this.employeesMiddleware}) : super(ActiveInitial());

  void changeActive() {
    emit(LoadingChangeActiveState());
    emit(ChangeActiveState());
  }
}
