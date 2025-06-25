import 'package:admin_dashboard/presentations/common_questions/domain/entities/add_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/use_cases/add_common_question_use_case.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_admin_question_event.dart';
part 'add_admin_question_state.dart';

class AddAdminQuestionBloc
    extends Bloc<AddAdminQuestionEvent, AddAdminQuestionState> {
  CommonQuestionMiddleware commonQuestionMiddleware;
  AddCommonQuestionUseCase addCommonQuestionUseCase;

  AddAdminQuestionBloc({
    required this.addCommonQuestionUseCase,
    required this.commonQuestionMiddleware,
  }) : super(AddAdminQuestionInitial()) {
    on<AddAdminCommonQuestionEvent>(addAdminCommonQuestions);
  }

  void addAdminCommonQuestions(
    AddAdminCommonQuestionEvent event,
    Emitter<AddAdminQuestionState> emit,
  ) async {
    emit(LoadingAddAdminCommonQuestionState());
    try {
      final token = await SafeStorage.read('token');
      final response = await addCommonQuestionUseCase(
        AddCommonQuestionEntity(
          question: commonQuestionMiddleware.getQuestion(),
          answer: commonQuestionMiddleware.getAnswer(),
          token: token!,
        ),
      );
      commonQuestionMiddleware.clearQuestionAnswer();

      response.fold(
        (faield) =>
            emit(FailedAddAdminCommonQuestionState(message: faield.message)),
        (success) => emit(SuccessAddAdminCommonQuestionState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedAddAdminCommonQuestionState(message: error.message));
    } catch (error) {
      emit(FailedAddAdminCommonQuestionState(message: 'error'));
    }
  }
}
