import 'package:admin_dashboard/presentations/users/presentation/middleware/user_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_user_state.dart';

class ActiveUserCubit extends Cubit<ActiveUserState> {
  UserMiddleware userMiddleware;
  ActiveUserCubit({required this.userMiddleware}) : super(ActiveUserInitial());

  void changeActive() {
    emit(LoadingActiveUserState());
    emit(DoActiveUserState());
  }
}
