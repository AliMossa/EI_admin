import 'package:admin_dashboard/presentations/employees/presentation/middleware/employees_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'kinds_state.dart';

class KindsCubit extends Cubit<KindsState> {
  EmployeesMiddleware employeesMiddleware;
  KindsCubit({required this.employeesMiddleware}) : super(KindsInitial());

  void changeKind() {
    emit(LoadingChangeKindsState());
    emit(ChangeKindsState());
  }
}
