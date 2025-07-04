import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/cubit/properties_types_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/properties/properties_bloc.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/desicion_drop_down_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/drop_down_desicion_model.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class PropertyListItemWidget extends StatelessWidget {
  int propertyType;
  Size size;
  List<PropertyRequestEntity> temp;
  PropertyListEntity propertyListEntity;
  GlobalKey<AnimatedListState> animatedKey;
  Function(PropertiesState) check;
  PropertyListItemWidget({
    required this.propertyType,
    required this.size,
    required this.temp,
    required this.propertyListEntity,
    required this.animatedKey,
    required this.check,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<PropertiesTypesCubit, PropertiesTypesState>(
      listener: (context, state) {
        if (state is ChangePropertiesTypes) {
          context.read<PropertiesBloc>().propertiesMiddlewar.getCorrectList(
            context.read<PropertiesBloc>(),
          );
        }
      },
      child: BlocBuilder<PropertiesBloc, PropertiesState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DesicionDropDownWidget(
                kinds: DropDownDesicionModel().getPropertyTypesList(),
                currntValue: propertyType,
                size: size,
                onPressed:
                    (value) => context
                        .read<PropertiesTypesCubit>()
                        .changePropertiesType(value),
              ),
              SizedBox(
                height: size.height * .76,
                width: size.width * .8,
                child: context
                    .read<PropertiesBloc>()
                    .propertiesMiddlewar
                    .showCorrectImage(
                      context.read<PropertiesBloc>(),
                      state,
                      size,
                    )
                    .fold(
                      (_) => AnimatedList(
                        key: animatedKey,
                        initialItemCount: propertyListEntity.list.length,
                        itemBuilder:
                            (context, index, animation) => FadeTransition(
                              opacity: animation.drive(Tween(begin: 0, end: 1)),
                              child: ItemListWidget(
                                name: propertyListEntity.list[index].location,
                                size: size,
                                isSold: propertyType > 0 ? true : false,
                                status: [],
                                date:
                                    propertyListEntity.list[index].propertyType,
                                onPressed:
                                    () => context.read<ChangePageBloc>().add(
                                      MoveToViewPropertyPageEvent(
                                        id: propertyListEntity.list[index].id,
                                        title: 'Property',
                                      ),
                                    ),
                              ),
                            ),
                      ),
                      (widget) => widget,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
