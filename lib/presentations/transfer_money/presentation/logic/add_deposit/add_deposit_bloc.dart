import 'package:admin_dashboard/presentations/transfer_money/domain/entities/add_deposit_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/add_despoist_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/use_cases/search_about_user_use_case.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/middleware/transfer_money_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_deposit_event.dart';
part 'add_deposit_state.dart';

class AddDepositBloc extends Bloc<AddDepositEvent, AddDepositState> {
  final TransferMoneyMiddleware transferMoneyMiddleware;
  final SearchAboutUserUseCase searchAboutUserUseCase;
  final AddDespoistUseCase addDespoistUseCase;
  AddDepositBloc({
    required this.searchAboutUserUseCase,
    required this.transferMoneyMiddleware,
    required this.addDespoistUseCase,
  }) : super(AddDepositInitial()) {
    on<SearchAboutUserEvent>(searchAboutUser);
    on<SendAddDepositEvent>(sendAddDeposit);
  }
  void searchAboutUser(
    SearchAboutUserEvent event,
    Emitter<AddDepositState> emit,
  ) async {
    emit(LoadingSearchAboutUserState());
    try {
      final response = await searchAboutUserUseCase(
        transferMoneyMiddleware.getSearchAboutUserText(),
      );
      response.fold(
        (failed) => emit(FailedSearchAboutUserState(message: failed.message)),
        (success) {
          transferMoneyMiddleware.setAboutUserEntity(success);
          emit(SuccessSearchAboutUserState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedSearchAboutUserState(message: error.message));
    } catch (error) {
      emit(FailedSearchAboutUserState(message: 'error'));
    }
  }

  void sendAddDeposit(
    SendAddDepositEvent event,
    Emitter<AddDepositState> emit,
  ) async {
    emit(LoadingSendAddDepositState());
    try {
      final token = await SafeStorage.read('token');
      final response = await addDespoistUseCase(
        AddDepositEntity(
          userId: event.userId,
          token: token!,
          amount: transferMoneyMiddleware.getDepositAmount(),
        ),
      );
      response.fold(
        (failed) => emit(FailedSendAddDepositState(message: failed.message)),
        (success) => emit(SuccessSendAddDepositState()),
      );
    } on ServerAdminException catch (error) {
      emit(FailedSendAddDepositState(message: error.message));
    } catch (error) {
      emit(FailedSendAddDepositState(message: 'error'));
    }
  }
}
