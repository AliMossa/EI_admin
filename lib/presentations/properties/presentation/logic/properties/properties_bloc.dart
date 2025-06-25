import 'package:admin_dashboard/presentations/properties/domain/use_cases/get_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/get_sold_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/re_get_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/re_get_sold_properties_use_case.dart';
import 'package:admin_dashboard/presentations/properties/presentation/middleware/properties_middlewar.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'properties_event.dart';
part 'properties_state.dart';

class PropertiesBloc extends Bloc<PropertiesEvent, PropertiesState> {
  PropertiesMiddlewar propertiesMiddlewar;
  GetPropertiesUseCase getPropertiesUseCase;
  GetSoldPropertiesUseCase getSoldPropertiesUseCase;
  ReGetSoldPropertiesUseCase reGetSoldPropertiesUseCase;
  ReGetPropertiesUseCase reGetPropertiesUseCase;
  PropertiesBloc({
    required this.propertiesMiddlewar,
    required this.getPropertiesUseCase,
    required this.reGetPropertiesUseCase,
    required this.getSoldPropertiesUseCase,
    required this.reGetSoldPropertiesUseCase,
  }) : super(PropertiesInitial()) {
    on<GetCorrectPropertiesEvent>(getCorrectProperties);
    on<GetPropertiesEvent>(getProperties);
    on<ReGetPropertiesEvent>(reGetProperties);
    on<GetSoldPropertiesEvent>(getSoldProperties);
    on<ReGetSoldPropertiesEvent>(reGetSoldProperties);
  }
  void getCorrectProperties(
    GetCorrectPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) => emit(GetCorrectPropertiesState());

  void getProperties(
    GetPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(LoadingGetPropertiesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getPropertiesUseCase(token!);
      response.fold(
        (failed) => emit(FailedGetPropertiesState(message: failed.message)),
        (success) async {
          propertiesMiddlewar.tempProperties = success.list;
          emit(SuccessGetPropertiesState());
          propertiesMiddlewar.setPropertyListEntity(success, true);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetPropertiesState(message: error.message));
    } catch (error) {
      emit(FailedGetPropertiesState(message: 'error'));
    }
  }

  void getSoldProperties(
    GetSoldPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(LoadingGetSoldPropertiesState());
    try {
      final token = await SafeStorage.read('token');
      final response = await getSoldPropertiesUseCase(token!);
      response.fold(
        (failed) => emit(FailedGetSoldPropertiesState(message: failed.message)),
        (success) async {
          propertiesMiddlewar.tempSoldProperties = success.list;
          emit(SuccessGetSoldPropertiesState());
          propertiesMiddlewar.setPropertyListEntity(success, true);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetSoldPropertiesState(message: error.message));
    } catch (error) {
      emit(FailedGetSoldPropertiesState(message: 'error'));
    }
  }

  void reGetProperties(
    ReGetPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(LoadingReGetPropertiesState());
    try {
      final response = await reGetPropertiesUseCase(event.link);
      response.fold(
        (failed) => emit(FailedReGetPropertiesState(message: failed.message)),
        (success) async {
          emit(SuccessReGetPropertiesState());
          propertiesMiddlewar.setSoldPropertyListEntity(success, false);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetPropertiesState(message: error.message));
    } catch (error) {
      emit(FailedReGetPropertiesState(message: 'error'));
    }
  }

  void reGetSoldProperties(
    ReGetSoldPropertiesEvent event,
    Emitter<PropertiesState> emit,
  ) async {
    emit(LoadingReGetSoldPropertiesState());
    try {
      final response = await reGetSoldPropertiesUseCase(event.link);
      response.fold(
        (failed) =>
            emit(FailedReGetSoldPropertiesState(message: failed.message)),
        (success) async {
          emit(SuccessReGetSoldPropertiesState());
          propertiesMiddlewar.setSoldPropertyListEntity(success, false);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetSoldPropertiesState(message: error.message));
    } catch (error) {
      emit(FailedReGetSoldPropertiesState(message: 'error'));
    }
  }
}
