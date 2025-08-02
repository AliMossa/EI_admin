import 'package:admin_dashboard/presentations/properties/domain/entities/property_desicion_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_request_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/new_property_study_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/set_property_sold_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/show_on_stage_use_case.dart';
import 'package:admin_dashboard/presentations/properties/domain/use_cases/view_property_use_case.dart';
import 'package:admin_dashboard/presentations/properties/presentation/middleware/properties_middlewar.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_property_event.dart';
part 'view_property_state.dart';

class ViewPropertyBloc extends Bloc<ViewPropertyEvent, ViewPropertyState> {
  PropertiesMiddlewar propertiesMiddlewar;
  ViewPropertyUseCase viewPropertyUseCase;
  SetPropertySoldUseCase setPropertySoldUseCase;
  NewPropertyStudyUseCase newPropertyStudyUseCase;
  ShowOnStageUseCase showOnStageUseCase;
  ViewPropertyBloc({
    required this.propertiesMiddlewar,
    required this.viewPropertyUseCase,
    required this.setPropertySoldUseCase,
    required this.newPropertyStudyUseCase,
    required this.showOnStageUseCase,
  }) : super(ViewPropertyInitial()) {
    on<ViewPropertyInfoEvent>(showPropertyInfo);
    on<SetPropertySoldEvent>(setPropertySold);
    on<NewPropertyStudyEvent>(newPropertyStudy);
    on<ShowOnStageEvent>(showOnStage);
  }

  void showPropertyInfo(
    ViewPropertyInfoEvent event,
    Emitter<ViewPropertyState> emit,
  ) async {
    emit(LoadingViewPropertyInfoState());
    try {
      final token = await SafeStorage.read('token');
      final response = await viewPropertyUseCase(
        ViewPropertyRequestEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedViewPropertyInfoState(message: failed.message)),
        (success) {
          propertiesMiddlewar.setViewPropertyEntity(success);
          emit(SuccessViewPropertyInfoState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedViewPropertyInfoState(message: error.message));
    } catch (error) {
      emit(FailedViewPropertyInfoState(message: 'error'));
    }
  }

  void setPropertySold(
    SetPropertySoldEvent event,
    Emitter<ViewPropertyState> emit,
  ) async {
    emit(LoadingSetPropertySoldState());
    try {
      final token = await SafeStorage.read('token');
      final response = await setPropertySoldUseCase(
        PropertyDesicionEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedSetPropertySoldState(message: failed.message)),
        (success) {
          emit(SuccessSetPropertySoldState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedSetPropertySoldState(message: error.message));
    } catch (error) {
      emit(FailedSetPropertySoldState(message: 'error'));
    }
  }

  void newPropertyStudy(
    NewPropertyStudyEvent event,
    Emitter<ViewPropertyState> emit,
  ) async {
    emit(LoadingNewPropertyStudyState());
    try {
      final token = await SafeStorage.read('token');
      final response = await newPropertyStudyUseCase(
        PropertyDesicionEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedNewPropertyStudyState(message: failed.message)),
        (success) {
          emit(SuccessNewPropertyStudyState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedNewPropertyStudyState(message: error.message));
    } catch (error) {
      emit(FailedNewPropertyStudyState(message: 'error'));
    }
  }

  void showOnStage(
    ShowOnStageEvent event,
    Emitter<ViewPropertyState> emit,
  ) async {
    emit(LoadingShowOnStageState());
    try {
      final token = await SafeStorage.read('token');
      final response = await showOnStageUseCase(
        PropertyDesicionEntity(id: event.id, token: token!),
      );
      response.fold(
        (failed) => emit(FailedShowOnStageState(message: failed.message)),
        (success) {
          emit(SuccessShowOnStageState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedShowOnStageState(message: error.message));
    } catch (error) {
      emit(FailedShowOnStageState(message: 'error'));
    }
  }
}
