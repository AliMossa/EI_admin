import 'package:admin_dashboard/presentations/employees/presentation/widgets/kinds_menu_widget.dart';
import 'package:flutter/widgets.dart';

class ViewKindsMenusWidget extends StatelessWidget {
  List<String> activeList;
  List<String> teamKindList;
  ViewKindsMenusWidget({
    required this.activeList,
    required this.teamKindList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        KindsMenuWidget(kinds: activeList),

        KindsMenuWidget(kinds: teamKindList),
      ],
    );
  }
}
