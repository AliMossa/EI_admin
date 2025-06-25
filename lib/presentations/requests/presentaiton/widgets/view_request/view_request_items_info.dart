import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/devider_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/request_notice_widget.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/cubit/desicion_cubit.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/request_info/request_info_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/desicion_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/economy_study_widget.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/images_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/property_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewRequestItemsInfo extends StatelessWidget {
  Size size;
  RequestInfoEntity requestInfoEntity;
  ViewRequestItemsInfo({
    required this.requestInfoEntity,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestInfoBloc, RequestInfoState>(
      builder: (context, state) {
        return SizedBox(
          width: size.width * .825,
          height: size.height * .8,
          child: ListView(
            children: [
              PropertyInformationWidget(
                propertyAge:
                    requestInfoEntity.requestDescriptionInfoEntity.propertyAge
                        .toString(),
                areaSize:
                    requestInfoEntity.requestDescriptionInfoEntity.areaSize,
                balconySize:
                    requestInfoEntity.requestDescriptionInfoEntity.balconySize,
                bathroomNumbers:
                    requestInfoEntity
                        .requestDescriptionInfoEntity
                        .bathroomNumbers
                        .toString(),
                propertyType:
                    requestInfoEntity.requestDescriptionInfoEntity.propertyType,
                roomNumbers:
                    requestInfoEntity.requestDescriptionInfoEntity.roomNumbers
                        .toString(),
                overlook:
                    requestInfoEntity.requestDescriptionInfoEntity.overlook
                        .toString(),
                decoration:
                    requestInfoEntity.requestDescriptionInfoEntity.decoration,
                flooringType:
                    requestInfoEntity.requestDescriptionInfoEntity.flooringType,
                kitchenType:
                    requestInfoEntity.requestDescriptionInfoEntity.kitchenType,
                paintingType:
                    requestInfoEntity.requestDescriptionInfoEntity.paintingType,
                contract:
                    requestInfoEntity.requestDescriptionInfoEntity.contract,
                price: requestInfoEntity.requestDescriptionInfoEntity.price,
                payWay: requestInfoEntity.requestDescriptionInfoEntity.payWay,
                state: requestInfoEntity.requestDescriptionInfoEntity.state,
                exactPosition:
                    requestInfoEntity
                        .requestDescriptionInfoEntity
                        .exactPosition,
                size: size,
              ),
              const SizedBox(height: 10),
              ImagesWidget(
                images: requestInfoEntity.requestImagesInfoEntity.images,
                documents: requestInfoEntity.requestImagesInfoEntity.documents,
                ids: requestInfoEntity.requestImagesInfoEntity.ids,
                onPress:
                    context
                        .read<RequestInfoBloc>()
                        .requestMiddleware
                        .viewImages,
                size: size,
              ),
              const SizedBox(height: 10),
              DeviderWidget(),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (requestInfoEntity.adminNote != null)
                    RequestNoticeWidget(
                      size: size,
                      content: requestInfoEntity.adminNote!,
                      isDirector: true,
                    ),
                  const SizedBox(width: 10),

                  if (requestInfoEntity
                          .requestEconomicInfoEntity
                          .agreedNegotiation !=
                      null)
                    RequestNoticeWidget(
                      size: size,
                      content:
                          requestInfoEntity
                              .requestEconomicInfoEntity
                              .agreedNegotiation!,
                    ),
                ],
              ),
              const SizedBox(height: 10),
              DeviderWidget(),
              const SizedBox(height: 10),
              EconomyStudyWidget(
                requestEconomicInfoEntity:
                    requestInfoEntity.requestEconomicInfoEntity,
                size: size,
              ),
              const SizedBox(height: 10),
              DeviderWidget(),
              const SizedBox(height: 10),
              (state is LoadingAcceptPropertyRequestState ||
                      state is LoadingRejectPropertyRequestState)
                  ? LoadingWidget()
                  : DesicionWidget(
                    id: requestInfoEntity.id,
                    currentValue:
                        context
                            .watch<DesicionCubit>()
                            .requestMiddleware
                            .getDesicionValue(),
                    title: 'Desicion',
                    size: size,
                  ),
            ],
          ),
        );
      },
    );
  }
}
