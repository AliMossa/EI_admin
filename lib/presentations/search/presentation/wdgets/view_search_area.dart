import 'package:admin_dashboard/presentations/search/presentation/logic/bloc/search_bloc.dart';
import 'package:admin_dashboard/presentations/search/presentation/wdgets/search_bar_field_widget.dart';
import 'package:admin_dashboard/presentations/search/presentation/wdgets/view_search_results_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewSearchArea extends StatelessWidget {
  Size size;

  ViewSearchArea({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Column(
          children: [
            SearchBarFieldWidget(size: size),
            context
                .read<SearchBloc>()
                .searchMiddleware
                .getCorrectWidget(state, size)
                .fold(
                  (_) => ViewSearchResultsWidget(
                    globalKey:
                        context
                            .read<SearchBloc>()
                            .searchMiddleware
                            .getAnimatedListGlobalKey(),
                    size: size,
                    searchTotalEntity:
                        context
                            .watch<SearchBloc>()
                            .searchMiddleware
                            .getSearchList(),
                    selectedValue:
                        context
                            .watch<SearchBloc>()
                            .searchMiddleware
                            .getCurrentSearchTypeValue(),
                  ),
                  (widget) => widget,
                ),
          ],
        );
      },
    );
  }
}
