import 'package:admin_dashboard/presentations/requests/presentaiton/middleware/request_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'desicion_state.dart';

class DesicionCubit extends Cubit<DesicionState> {
  RequestMiddleware requestMiddleware;
  DesicionCubit({required this.requestMiddleware}) : super(DesicionInitial());

  void changeDesicion(int desicionValue) {
    emit(LoadingChangeDesicionState());
    requestMiddleware.setDesicionValue(desicionValue);

    emit(ChangeDesicionState(desicionValue: desicionValue));
  }
}
