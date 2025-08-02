import 'package:admin_dashboard/presentations/wallet/domain/entities/wallet_entity_request.dart';
import 'package:admin_dashboard/presentations/wallet/domain/repositories/wallet_repository.dart';
import 'package:admin_dashboard/presentations/wallet/presentation/middleware/wallet_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  WalletMiddleware walletMiddleware;
  WalletRepository walletRepository;
  WalletBloc({required this.walletMiddleware, required this.walletRepository})
    : super(WalletInitial()) {
    on<GetWalletMoneyEvent>(getWalletMoney);
  }

  void getWalletMoney(
    GetWalletMoneyEvent event,
    Emitter<WalletState> emit,
  ) async {
    emit(LoadingGetWalletMoneyState());

    try {
      final token = await SafeStorage.read('token');
      final response = await walletRepository.getWalletMoney(
        WalletEntityRequest(token: token!),
      );
      response.fold(
        (failed) => emit(FailedGetWalletMoneyState(message: failed.message)),
        (success) {
          walletMiddleware.setWallet(success);
          emit(SuccessGetWalletMoneyState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedGetWalletMoneyState(message: error.message));
    } catch (error) {
      emit(FailedGetWalletMoneyState(message: 'error'));
    }
  }
}
