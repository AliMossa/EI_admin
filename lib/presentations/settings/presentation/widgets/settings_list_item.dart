import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/settings/presentation/widgets/settings_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsListItem extends StatelessWidget {
  Size size;
  SettingsListItem({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .5,
      height: size.height * .8,
      child: ListView(
        children: [
          SettingsItemWidget(
            title: 'Change Password',
            function:
                () => context.read<ChangePageBloc>().add(
                  MoveToChangePsswordPageEvent(title: 'Change Password'),
                ),
            prefix: Icon(Icons.lock_outline_rounded),
            size: size,
          ),
        ],
      ),
    );
  }
}
