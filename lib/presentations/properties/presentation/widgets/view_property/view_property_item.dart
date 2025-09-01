import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/view_property/view_property_list_item.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewPropertyItem extends StatelessWidget {
  int id;
  ViewPropertyItem({required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<ViewPropertyBloc, ViewPropertyState>(
      listener:
          (context, state) => context
              .read<ViewPropertyBloc>()
              .propertiesMiddlewar
              .showState(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => AnimatedOpacity(
              opacity: state is MoveToViewPropertyPageState ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInBack,
              child:
                  state is MoveToViewPropertyPageState
                      ? ViewPropertyListItem(
                        id: id,
                        type:
                            context
                                .watch<ViewPropertyBloc>()
                                .propertiesMiddlewar
                                .getPropertiesTypes(),
                        size: moreInfo,
                        viewPropertyEntity:
                            context
                                .watch<ViewPropertyBloc>()
                                .propertiesMiddlewar
                                .getViewPropertyEntity(),
                      )
                      : const SizedBox(),
            ),
      ),
    );
  }
}
