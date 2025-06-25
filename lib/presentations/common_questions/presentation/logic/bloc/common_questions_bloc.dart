import 'package:admin_dashboard/presentations/common_questions/domain/entities/remove_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/get_common_questions_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/get_user_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/re_get_common_questions_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/re_get_use_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/remove_user_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:admin_dashboard/presentations/users/domain/use_cases/re_get_users_use_case.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'common_questions_event.dart';
part 'common_questions_state.dart';

class CommonQuestionsBloc
    extends Bloc<CommonQuestionsEvent, CommonQuestionsState> {
  GetCommonQuestionsUseCase getCommonQuestionsUseCase;
  RemoveCommonQuestionUseCase removeCommonQuestionUseCase;
  GetUserCommonQuestionUseCase getUserCommonQuestionUseCase;
  RemoveUserCommonQuestionUseCase removeUserCommonQuestionUseCase;
  ReGetUseCommonQuestionUseCase reGetUseCommonQuestionUseCase;
  ReGetCommonQuestionsUseCase reGetCommonQuestionsUseCase;
  CommonQuestionMiddleware commonQuestionMiddleware;
  CommonQuestionsBloc({
    required this.reGetUseCommonQuestionUseCase,
    required this.reGetCommonQuestionsUseCase,
    required this.getUserCommonQuestionUseCase,
    required this.removeCommonQuestionUseCase,
    required this.removeUserCommonQuestionUseCase,
    required this.commonQuestionMiddleware,
    required this.getCommonQuestionsUseCase,
  }) : super(CommonQuestionsInitial()) {
    on<GetSuitableCommonQuestionEvent>(getSuitableCommonQuestion);
    on<GetAdminCommonQuestionsEvent>(getAdminCommonQuestions);
    on<GetUserCommonQuestionsEvent>(getUserCommonQuestions);
    on<RemoveAdminCommonQuestionEvent>(removeAdminCommonQuestions);
    on<RemoveUserCommonQuestionEvent>(removeUserCommonQuestions);
    on<ReGetUserCommonQuestionsEvent>(reGetUserCommonQuestions);
    on<ReGetAdminCommonQuestionsEvent>(reGetAdminCommonQuestions);
  }

  void getSuitableCommonQuestion(
    GetSuitableCommonQuestionEvent getSuitableCommonQuestion,
    Emitter<CommonQuestionsState> emit,
  ) => emit(StartGetSuitalbeCommonQuestionsState());

  void getAdminCommonQuestions(
    GetAdminCommonQuestionsEvent event,
    Emitter<CommonQuestionsState> emit,
  ) async {
    emit(LoadingGetAdminCommonQuestionsState());
    try {
      final response = await getCommonQuestionsUseCase();
      response.fold(
        (faield) =>
            emit(FailedGetAdminCommonQuestionsState(message: faield.message)),
        (success) {
          commonQuestionMiddleware.tempCommonQuestions = success.list;

          commonQuestionMiddleware.setCommonQuestions(success, true);
          emit(SuccessGetAdminCommonQuestionsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetAdminCommonQuestionsState(message: error.message));
    } catch (error) {
      emit(FailedGetAdminCommonQuestionsState(message: 'error'));
    }
  }

  void getUserCommonQuestions(
    GetUserCommonQuestionsEvent event,
    Emitter<CommonQuestionsState> emit,
  ) async {
    emit(LoadingGetUserCommonQuestionsState());
    try {
      final token = await SafeStorage.read('token');

      final response = await getUserCommonQuestionUseCase(token!);
      response.fold(
        (failed) =>
            emit(FailedGetUserCommonQuestionsState(message: failed.message)),
        (success) {
          commonQuestionMiddleware.tempUserQuestions = success.questions;
          commonQuestionMiddleware.setUserCommonQuestions(success, true);
          emit(SuccessGetUserCommonQuestionsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetUserCommonQuestionsState(message: error.message));
    } catch (error) {
      emit(FailedGetUserCommonQuestionsState(message: 'error'));
    }
  }

  void removeAdminCommonQuestions(
    RemoveAdminCommonQuestionEvent event,
    Emitter<CommonQuestionsState> emit,
  ) async {
    emit(LoadingRemoveAdminCommonQuestionState());
    try {
      final token = await SafeStorage.read('token');
      final response = await removeCommonQuestionUseCase(
        RemoveCommonQuestionEntity(id: event.id, token: token!),
      );
      commonQuestionMiddleware.removeCommonQuestionItem(event.id);
      response.fold(
        (faield) =>
            emit(FailedRemoveAdminCommonQuestionState(message: faield.message)),
        (success) => emit(SuccessRemoveAdminCommonQuestionState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedRemoveAdminCommonQuestionState(message: error.message));
    } catch (error) {
      emit(FailedRemoveAdminCommonQuestionState(message: 'error'));
    }
  }

  void removeUserCommonQuestions(
    RemoveUserCommonQuestionEvent event,
    Emitter<CommonQuestionsState> emit,
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
        (success) => emit(SuccessRemoveUserCommonQuestionState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedRemoveUserCommonQuestionState(message: error.message));
    } catch (error) {
      emit(FailedRemoveUserCommonQuestionState(message: 'error'));
    }
  }

  void reGetAdminCommonQuestions(
    ReGetAdminCommonQuestionsEvent event,
    Emitter<CommonQuestionsState> emit,
  ) async {
    emit(LoadingReGetAdminCommonQuestionsState());
    try {
      final response = await reGetCommonQuestionsUseCase(event.link);
      response.fold(
        (faield) =>
            emit(FailedReGetAdminCommonQuestionsState(message: faield.message)),
        (success) {
          emit(SuccessGetAdminCommonQuestionsState());

          commonQuestionMiddleware.setCommonQuestions(success, false);
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetAdminCommonQuestionsState(message: error.message));
    } catch (error) {
      emit(FailedReGetAdminCommonQuestionsState(message: 'error'));
    }
  }

  void reGetUserCommonQuestions(
    ReGetUserCommonQuestionsEvent event,
    Emitter<CommonQuestionsState> emit,
  ) async {
    emit(LoadingReGetUserCommonQuestionsState());
    try {
      final response = await reGetUseCommonQuestionUseCase(event.link);
      response.fold(
        (failed) =>
            emit(FailedReGetUserCommonQuestionsState(message: failed.message)),
        (success) {
          commonQuestionMiddleware.setUserCommonQuestions(success, false);
          emit(SuccessGetUserCommonQuestionsState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReGetUserCommonQuestionsState(message: error.message));
    } catch (error) {
      emit(FailedReGetUserCommonQuestionsState(message: 'error'));
    }
  }
}
