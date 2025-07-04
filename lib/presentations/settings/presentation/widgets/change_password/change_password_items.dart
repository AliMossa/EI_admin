import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/settings/presentation/logic/bloc/password_bloc.dart';
import 'package:admin_dashboard/presentations/settings/presentation/widgets/change_password/change_password_list_items.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordItems extends StatelessWidget {
  const ChangePasswordItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<PasswordBloc, PasswordState>(
      listener:
          (context, state) => context
              .read<PasswordBloc>()
              .settingsMiddleware
              .returnChangePasswordState(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => AnimatedOpacity(
              opacity: state is MoveToChangePsswordPageState ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child:
                  state is MoveToChangePsswordPageState
                      ? ChangePasswordListItems(size: moreInfo)
                      : const SizedBox(),
            ),
      ),
    );
  }
}
