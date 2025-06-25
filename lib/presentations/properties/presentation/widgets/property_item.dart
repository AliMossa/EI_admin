import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/cubit/properties_types_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/properties/properties_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/property_list_item_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder:
          (context, state) => AnimatedOpacity(
            opacity: state is MoveToPropertiesPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child:
                state is MoveToPropertiesPageState
                    ? PropertyListItemWidget(
                      propertyType:
                          context
                              .watch<PropertiesTypesCubit>()
                              .propertiesMiddlewar
                              .getPropertiesTypes(),
                      size: moreInfo,
                      propertyListEntity:
                          context
                              .watch<PropertiesBloc>()
                              .propertiesMiddlewar
                              .getAprropriatePropertyListEntity(),
                      temp:
                          context
                              .watch<PropertiesBloc>()
                              .propertiesMiddlewar
                              .tempProperties,
                      animatedKey:
                          context
                              .watch<PropertiesBloc>()
                              .propertiesMiddlewar
                              .getPropertyGlobalKey(),
                      check:
                          (state) => context
                              .read<PropertiesBloc>()
                              .propertiesMiddlewar
                              .getCorrectAnimatedListItem(state),
                    )
                    : const SizedBox(),
          ),
    );
  }
}
