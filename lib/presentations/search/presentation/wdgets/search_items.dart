import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/search/presentation/logic/bloc/search_bloc.dart';
import 'package:admin_dashboard/presentations/search/presentation/wdgets/view_search_area.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchItems extends StatelessWidget {
  const SearchItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<SearchBloc, SearchState>(
      listener:
          (context, state) => context
              .read<SearchBloc>()
              .searchMiddleware
              .showSearchFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => Stack(
              children: [
                AnimatedOpacity(
                  opacity: state is MoveToSearchPageState ? 1 : 0,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInBack,

                  child:
                      state is MoveToSearchPageState
                          ? ViewSearchArea(size: moreInfo)
                          : SizedBox(),
                ),
              ],
            ),
      ),
    );
  }
}
