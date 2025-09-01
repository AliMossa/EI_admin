import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/widgets/view_property/view_property_desicion_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_information_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/request_notice_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/economy_study_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/images_widget.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewPropertyListItem extends StatelessWidget {
  Size size;
  int id;
  int type;
  ViewPropertyEntity viewPropertyEntity;
  ViewPropertyListItem({
    required this.id,
    required this.size,
    required this.viewPropertyEntity,
    required this.type,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width * .825,
      height: size.height * .8,
      child: context
          .read<ViewPropertyBloc>()
          .propertiesMiddlewar
          .showCorrectViewProperty(
            context.read<ViewPropertyBloc>(),
            context.read<ViewPropertyBloc>().state,
            size,
          )
          .fold(
            (_) => ListView(
              children: [
                PropertyInformationWidget(
                  areaSize:
                      viewPropertyEntity.requestDescriptionInfoEntity.areaSize,
                  balconySize:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .balconySize!,
                  bathroomNumbers:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .bathroomNumbers
                          .toString(),
                  roomNumbers:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .roomNumbers
                          .toString(),
                  decoration:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .decoration!,
                  flooringType:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .flooringType!,
                  kitchenType:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .kitchenType!,
                  paintingType:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .paintingType!,
                  propertyAge:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .propertyAge
                          .toString(),
                  contract:
                      viewPropertyEntity.requestDescriptionInfoEntity.contract,
                  exactPosition:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .exactPosition,
                  overlook:
                      viewPropertyEntity.requestDescriptionInfoEntity.overlook
                          .toString(),
                  payWay:
                      viewPropertyEntity.requestDescriptionInfoEntity.payWay,
                  price: viewPropertyEntity.requestDescriptionInfoEntity.price,
                  propertyType:
                      viewPropertyEntity
                          .requestDescriptionInfoEntity
                          .propertyType,
                  state: viewPropertyEntity.requestDescriptionInfoEntity.state,
                  size: size,
                ),
                const SizedBox(height: 10),

                ImagesWidget(
                  documents:
                      viewPropertyEntity.requestImagesInfoEntity.documents,
                  ids: viewPropertyEntity.requestImagesInfoEntity.ids,
                  images: viewPropertyEntity.requestImagesInfoEntity.images,
                  buyDocuments: viewPropertyEntity.documentsImagesEntity.images,
                  onPress:
                      context
                          .read<ViewPropertyBloc>()
                          .propertiesMiddlewar
                          .viewImages,
                  size: size,
                ),
                const SizedBox(height: 10),
                if (viewPropertyEntity.aggreement != null)
                  RequestNoticeWidget(
                    size: size,
                    content: viewPropertyEntity.aggreement!,
                    isDirector: false,
                  ),
                EconomyStudyWidget(
                  agreedNegotiation: '',
                  buyingPrice:
                      viewPropertyEntity.requestEconomicInfoEntity.buyingPrice,
                  chancePrice:
                      viewPropertyEntity.requestEconomicInfoEntity.chancePrice,
                  expectedPrice:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .expectedPrice,
                  incommingTime:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .incommingTime,
                  investmentMode:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .investmentMode,
                  investmentTime:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .incommingTime,
                  numberOfChances:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .numberOfChances,
                  profitPercent:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .profitPercent,
                  propertyManagement:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .propertyManagement,
                  rentingPrice:
                      viewPropertyEntity.requestEconomicInfoEntity.rentingPrice,
                  size: size,
                  totalExpectedTaxes:
                      viewPropertyEntity
                          .requestEconomicInfoEntity
                          .totalExpectedTaxes,
                ),

                const SizedBox(height: 10),

                type > 0
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
            (widget) => widget,
          ),
    );
  }
}
