import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/view_property/view_property_desicion_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_information_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/sold_tag_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/images_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewPropertyListItem extends StatelessWidget {
  Size size;
  int id;
  ViewPropertyEntity viewPropertyEntity;
  ViewPropertyListItem({
    required this.id,
    required this.size,
    required this.viewPropertyEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .825,
      height: size.height * .8,
      child: ListView(
        children: [
          PropertyInformationWidget(
            areaSize: viewPropertyEntity.requestDescriptionInfoEntity.areaSize,
            balconySize:
                viewPropertyEntity.requestDescriptionInfoEntity.balconySize,
            bathroomNumbers:
                viewPropertyEntity.requestDescriptionInfoEntity.bathroomNumbers
                    .toString(),
            roomNumbers:
                viewPropertyEntity.requestDescriptionInfoEntity.roomNumbers
                    .toString(),
            decoration:
                viewPropertyEntity.requestDescriptionInfoEntity.decoration,
            flooringType:
                viewPropertyEntity.requestDescriptionInfoEntity.flooringType,
            kitchenType:
                viewPropertyEntity.requestDescriptionInfoEntity.kitchenType,
            paintingType:
                viewPropertyEntity.requestDescriptionInfoEntity.paintingType,
            propertyAge:
                viewPropertyEntity.requestDescriptionInfoEntity.propertyAge
                    .toString(),
            contract: viewPropertyEntity.requestDescriptionInfoEntity.contract,
            exactPosition:
                viewPropertyEntity.requestDescriptionInfoEntity.exactPosition,
            overlook:
                viewPropertyEntity.requestDescriptionInfoEntity.overlook
                    .toString(),
            payWay: viewPropertyEntity.requestDescriptionInfoEntity.payWay,
            price: viewPropertyEntity.requestDescriptionInfoEntity.price,
            propertyType:
                viewPropertyEntity.requestDescriptionInfoEntity.propertyType,
            state: viewPropertyEntity.requestDescriptionInfoEntity.state,
            size: size,
          ),
          const SizedBox(height: 10),

          ImagesWidget(
            documents: viewPropertyEntity.requestImagesInfoEntity.documents,
            ids: viewPropertyEntity.requestImagesInfoEntity.ids,
            images: viewPropertyEntity.requestImagesInfoEntity.images,
            onPress:
                context.read<ViewPropertyBloc>().propertiesMiddlewar.viewImages,
            size: size,
          ),
          const SizedBox(height: 10),

          viewPropertyEntity.requestDescriptionInfoEntity.status!.contains(
                'تم البيع',
              )
              ? const SizedBox()
              : ViewPropertyDesicionWidget(
                id: id,
                currentValue:
                    context
                        .watch<DesicionCubit>()
                        .propertiesMiddlewar
                        .getCurrentValue(),
                size: size,
                title: 'Desicion',
              ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
