import 'package:admin_dashboard/presentations/common_questions/presentation/middleware/common_question_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'types_state.dart';

class TypesCubit extends Cubit<TypesState> {
  CommonQuestionMiddleware commonQuestionMiddleware;
  TypesCubit({required this.commonQuestionMiddleware}) : super(TypesInitial());

  void changeType() {
    emit(LoadingChangeTypesState());
    emit(ChangeTypesState());
  }
}
