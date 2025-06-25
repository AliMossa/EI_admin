import 'package:admin_dashboard/presentations/search/domain/entities/search_request_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/use_cases/re_get_serach_use_case.dart';
import 'package:admin_dashboard/presentations/search/domain/use_cases/search_use_case.dart';
import 'package:admin_dashboard/presentations/search/presentation/middlewares/search_middleware.dart';
import 'package:admin_dashboard/util/errors/admin_exceptions.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchMiddleware searchMiddleware;
  SearchUseCase searchUseCase;
  ReGetSerachUseCase reGetSerachUseCase;
  SearchBloc({
    required this.reGetSerachUseCase,
    required this.searchUseCase,
    required this.searchMiddleware,
  }) : super(SearchInitial()) {
    on<SendSearchEvent>(sendSearch);
    on<ReSendSearchEvent>(reSendSearch);
  }

  void sendSearch(SendSearchEvent event, Emitter<SearchState> emit) async {
    emit(LoadingSendSearchState());
    try {
      final token = await SafeStorage.read('token');
      final response = await searchUseCase(
        SearchRequestEntity(
          token: token!,
          searchEntity: searchMiddleware.getSearchVariables(),
        ),
      );
      response.fold(
        (failed) {
          emit(FailedSendSearchState(message: failed.message));
          searchMiddleware.clearSearchList();
        },
        (success) {
          searchMiddleware.temp = success.list;
          searchMiddleware.setSearchList(success, true);
          emit(SuccessSendSearchState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedSendSearchState(message: error.message));
      searchMiddleware.clearSearchList();
    } catch (error) {
      emit(FailedSendSearchState(message: 'error'));
      searchMiddleware.clearSearchList();
    }
  }

  void reSendSearch(ReSendSearchEvent event, Emitter<SearchState> emit) async {
    emit(LoadingReSendSearchState());
    try {
      final token = await SafeStorage.read('token');
      final response = await reGetSerachUseCase(event.link);
      response.fold(
        (failed) {
          emit(FailedReSendSearchState(message: failed.message));
          searchMiddleware.clearSearchList();
        },
        (success) {
          searchMiddleware.setSearchList(success, false);
          emit(SuccessReSendSearchState());
        },
      );
    } on ServerAdminException catch (error) {
      emit(FailedReSendSearchState(message: error.message));
      searchMiddleware.clearSearchList();
    } catch (error) {
      emit(FailedReSendSearchState(message: 'error'));
      searchMiddleware.clearSearchList();
    }
  }
}
