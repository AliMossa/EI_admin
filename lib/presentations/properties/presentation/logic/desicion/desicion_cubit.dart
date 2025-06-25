import 'package:admin_dashboard/presentations/properties/presentation/middleware/properties_middlewar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'desicion_state.dart';

class DesicionCubit extends Cubit<DesicionState> {
  PropertiesMiddlewar propertiesMiddlewar;
  DesicionCubit({required this.propertiesMiddlewar}) : super(DesicionInitial());

  void setCurrentValue(int newValue) {
    emit(LoadingSetDesicionState());
    propertiesMiddlewar.setCurrentValue(newValue);
    emit(SetDesicionState());
  }
}
