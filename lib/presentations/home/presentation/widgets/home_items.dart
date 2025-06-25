import 'package:admin_dashboard/presentations/home/presentation/widgets/home_list_items.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeItems extends StatelessWidget {
  const HomeItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder: (context, state) {
        return AnimatedOpacity(
          opacity: state is MoveToHomePageState ? 1 : 0,
          curve: Curves.easeInBack,
          duration: const Duration(milliseconds: 500),

          child:
              state is MoveToHomePageState ? HomeListItems() : const SizedBox(),
        );
      },
    );
  }
}
