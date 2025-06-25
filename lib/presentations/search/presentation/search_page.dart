import 'package:admin_dashboard/presentations/search/data/repositories_imp_sources/search_repository_imp_source.dart';
import 'package:admin_dashboard/presentations/search/domain/use_cases/re_get_serach_use_case.dart';
import 'package:admin_dashboard/presentations/search/domain/use_cases/search_use_case.dart';
import 'package:admin_dashboard/presentations/search/presentation/logic/bloc/search_bloc.dart';
import 'package:admin_dashboard/presentations/search/presentation/logic/cubit/search_types_cubit.dart';
import 'package:admin_dashboard/presentations/search/presentation/middlewares/search_middleware.dart';
import 'package:admin_dashboard/presentations/search/presentation/wdgets/search_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  final SearchMiddleware _searchMiddleware = SearchMiddleware();
  SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchTypesCubit>(
          create:
              (context) =>
                  SearchTypesCubit(searchMiddleware: _searchMiddleware),
        ),
        BlocProvider<SearchBloc>(
          create:
              (context) => SearchBloc(
                reGetSerachUseCase: ReGetSerachUseCase(
                  searchRepository: SearchRepositoryImpSource(),
                ),
                searchMiddleware: _searchMiddleware,
                searchUseCase: SearchUseCase(
                  searchRepository: SearchRepositoryImpSource(),
                ),
              ),
        ),
      ],
      child: SearchItems(),
    );
  }
}
