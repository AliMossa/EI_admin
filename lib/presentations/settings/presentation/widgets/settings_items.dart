import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/settings/presentation/widgets/settings_list_item.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsItems extends StatelessWidget {
  const SettingsItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => AnimatedOpacity(
            opacity: state is MoveToSettingsPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,
            child:
                state is MoveToSettingsPageState
                    ? SettingsListItem(size: moreInfo)
                    : SizedBox(),
          ),
    );
  }
}
