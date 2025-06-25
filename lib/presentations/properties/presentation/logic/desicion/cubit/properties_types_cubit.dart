import 'package:admin_dashboard/presentations/properties/presentation/middleware/properties_middlewar.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'properties_types_state.dart';

class PropertiesTypesCubit extends Cubit<PropertiesTypesState> {
  PropertiesMiddlewar propertiesMiddlewar;
  PropertiesTypesCubit({required this.propertiesMiddlewar})
    : super(PropertiesTypesInitial());

  void changePropertiesType(int newValue) {
    emit(LoadingChangePropertiesTypes());
    propertiesMiddlewar.setPropertiesTypes(newValue);
    emit(ChangePropertiesTypes());
  }
}
