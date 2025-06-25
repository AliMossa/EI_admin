import 'package:admin_dashboard/presentations/search/presentation/middlewares/search_middleware.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_types_state.dart';

class SearchTypesCubit extends Cubit<SearchTypesState> {
  SearchMiddleware searchMiddleware;
  SearchTypesCubit({required this.searchMiddleware})
    : super(SearchTypesInitial());
  void changeType() {
    emit(LoadingChangeSearchTypeState());
    emit(ChangeSearchTypeState());
  }
}
