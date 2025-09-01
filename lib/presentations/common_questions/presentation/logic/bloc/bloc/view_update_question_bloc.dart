import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/update_user_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_user_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/update_user_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'view_update_question_event.dart';
part 'view_update_question_state.dart';

class ViewUpdateQuestionBloc
    extends Bloc<ViewUpdateQuestionEvent, ViewUpdateQuestionState> {
  RemoveCommonQuestionUseCase removeCommonQuestionUseCase;
  UpdateUserQuestionUseCase updateUserQuestionUseCase;
  RemoveUserCommonQuestionUseCase removeUserCommonQuestionUseCase;

  CommonQuestionMiddleware commonQuestionMiddleware;

  ViewUpdateQuestionBloc({
    required this.updateUserQuestionUseCase,
    required this.removeCommonQuestionUseCase,
    required this.commonQuestionMiddleware,
    required this.removeUserCommonQuestionUseCase,
  }) : super(ViewUpdateQuestionInitial()) {
    on<RemoveAdminCommonQuestionFromInsidEvent>(removeAdminCommonQuestions);
    on<UpdateAdminCommonQuestionEvent>(updateUserCommonQuestions);
    on<RemoveUserCommonQuestionEvent>(removeUserCommonQuestions);
  }

  void removeAdminCommonQuestions(
    RemoveAdminCommonQuestionFromInsidEvent event,
    Emitter<ViewUpdateQuestionState> emit,
  ) async {
    emit(LoadingRemoveAdminCommonQuestionFromInsideState());
    try {
      final token = await SafeStorage.read('token');
      final response = await removeCommonQuestionUseCase(
        RemoveCommonQuestionEntity(id: event.id, token: token!),
      );
      commonQuestionMiddleware.removeCommonQuestionItem(event.id);
      response.fold(
        (faield) => emit(
          FailedRemoveAdminCommonQuestionFromInsideState(
            message: faield.message,
          ),
        ),
        (success) => emit(SuccessRemoveAdminCommonQuestionFromInsideState()),
      );
    } on ServerAdminException catch (error) {
      emit(
        FailedRemoveAdminCommonQuestionFromInsideState(message: error.message),
      );
    } catch (error) {
      emit(FailedRemoveAdminCommonQuestionFromInsideState(message: 'error'));
    }
  }

  void updateUserCommonQuestions(
    UpdateAdminCommonQuestionEvent event,
    Emitter<ViewUpdateQuestionState> emit,
  ) async {
    emit(LoadingUpdateAdminCommonQuestionState());
    try {
      final token = await SafeStorage.read('token');
      final response = await updateUserQuestionUseCase(
        UpdateUserQuestionEntity(
          id: event.id,
          token: token!,
          answer: commonQuestionMiddleware.getAnswer(),
        ),
      );
      response.fold(
        (faield) =>
            emit(FailedUpdateAdminCommonQuestionState(message: faield.message)),
        (success) => emit(SuccessUpdateAdminCommonQuestionState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedUpdateAdminCommonQuestionState(message: error.message));
    } catch (error) {
      emit(FailedUpdateAdminCommonQuestionState(message: 'error'));
    }
  }

  void removeUserCommonQuestions(
    RemoveUserCommonQuestionEvent event,
    Emitter<ViewUpdateQuestionState> emit,
  ) async {
    emit(LoadingRemoveUserCommonQuestionState());
    try {
      final token = await SafeStorage.read('token');
      final response = await removeUserCommonQuestionUseCase(
        RemoveCommonQuestionEntity(id: event.id, token: token!),
      );

      response.fold(
        (faield) =>
            emit(FailedRemoveUserCommonQuestionState(message: faield.message)),
        (success) {
          emit(SuccessRemoveUserCommonQuestionState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedRemoveUserCommonQuestionState(message: error.message));
    } catch (error) {
      emit(FailedRemoveUserCommonQuestionState(message: 'error'));
    }
  }
}
