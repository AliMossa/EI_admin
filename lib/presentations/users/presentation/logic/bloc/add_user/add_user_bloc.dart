import 'package:admin_dashboard/presentations/users/domain/use_cases/add_user_use_case.dart';
import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_user_event.dart';
part 'add_user_state.dart';

class AddUserBloc extends Bloc<AddUserEvent, AddUserState> {
  AddUserUseCase addUserUseCase;
  UserMiddleware userMiddleware;
  AddUserBloc({required this.addUserUseCase, required this.userMiddleware})
    : super(AddUserInitial()) {
    on<AddUserEvent>(addUser);
  }
  void addUser(AddUserEvent event, Emitter<AddUserState> emit) async {
    emit(LoadingAddUserState());
    try {
      final response = await addUserUseCase(userMiddleware.getAddUserEntity());
      response.fold(
        (failed) => emit(FailedAddUserState(message: failed.message)),
        (success) {
          emit(SuccessAddUserState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedAddUserState(message: error.message));
    } catch (error) {
      emit(FailedAddUserState(message: 'error'));
    }
  }
}
