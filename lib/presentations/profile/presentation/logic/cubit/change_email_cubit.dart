import 'package:admin_dashboard/presentations/profile/presentation/logic/bloc/profile_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'change_email_state.dart';

class ChangeEmailCubit extends Cubit<ChangeEmailState> {
  ChangeEmailCubit() : super(ChangeEmailInitial());

  void updateEmail() => emit(UpdateEmailFieldProfileState());
  void saveEmail() => emit(SaveEmailFieldProfileState());
}
