import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_info_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/request_info/request_info_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/requests/requests_bloc.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class RequestMiddleware {
  int _desicionValue = 0;
  String? _adminNotice;
  final GlobalKey<AnimatedListState> _animatedGlobalKey =
      GlobalKey<AnimatedListState>();
  TotalRequestEntity _totalRequestEntity = TotalRequestEntity.init();
  List<RequestEntity> tempList = [];
  RequestInfoEntity _requestInfoEntity = RequestInfoEntity.init();
  void setRequestInfoEntity(RequestInfoEntity requestInfoEntity) {
    {
      _requestInfoEntity.adminNote = requestInfoEntity.adminNote;
      _requestInfoEntity.creatingDate = requestInfoEntity.creatingDate;
      _requestInfoEntity.id = requestInfoEntity.id;
    }

    {
      _requestInfoEntity.requestDescriptionInfoEntity.areaSize =
          requestInfoEntity.requestDescriptionInfoEntity.areaSize;
      _requestInfoEntity.requestDescriptionInfoEntity.balconySize =
          requestInfoEntity.requestDescriptionInfoEntity.balconySize;
      _requestInfoEntity.requestDescriptionInfoEntity.bathroomNumbers =
          requestInfoEntity.requestDescriptionInfoEntity.bathroomNumbers;
      _requestInfoEntity.requestDescriptionInfoEntity.contract =
          requestInfoEntity.requestDescriptionInfoEntity.contract;
      _requestInfoEntity.requestDescriptionInfoEntity.decoration =
          requestInfoEntity.requestDescriptionInfoEntity.decoration;
      _requestInfoEntity.requestDescriptionInfoEntity.exactPosition =
          requestInfoEntity.requestDescriptionInfoEntity.exactPosition;
      _requestInfoEntity.requestDescriptionInfoEntity.flooringType =
          requestInfoEntity.requestDescriptionInfoEntity.flooringType;
      _requestInfoEntity.requestDescriptionInfoEntity.kitchenType =
          requestInfoEntity.requestDescriptionInfoEntity.kitchenType;
      _requestInfoEntity.requestDescriptionInfoEntity.legalCheck =
          requestInfoEntity.requestDescriptionInfoEntity.legalCheck;
      _requestInfoEntity.requestDescriptionInfoEntity.areaSize =
          requestInfoEntity.requestDescriptionInfoEntity.areaSize;
      _requestInfoEntity.requestDescriptionInfoEntity.overlook =
          requestInfoEntity.requestDescriptionInfoEntity.overlook;
      _requestInfoEntity.requestDescriptionInfoEntity.paintingType =
          requestInfoEntity.requestDescriptionInfoEntity.paintingType;
      _requestInfoEntity.requestDescriptionInfoEntity.payWay =
          requestInfoEntity.requestDescriptionInfoEntity.payWay;
      _requestInfoEntity.requestDescriptionInfoEntity.price =
          requestInfoEntity.requestDescriptionInfoEntity.price;
      _requestInfoEntity.requestDescriptionInfoEntity.propertyAge =
          requestInfoEntity.requestDescriptionInfoEntity.propertyAge;
      _requestInfoEntity.requestDescriptionInfoEntity.propertyType =
          requestInfoEntity.requestDescriptionInfoEntity.propertyType;
      _requestInfoEntity.requestDescriptionInfoEntity.roomNumbers =
          requestInfoEntity.requestDescriptionInfoEntity.roomNumbers;
      _requestInfoEntity.requestDescriptionInfoEntity.userId =
          requestInfoEntity.requestDescriptionInfoEntity.userId;
      _requestInfoEntity.requestDescriptionInfoEntity.state =
          requestInfoEntity.requestDescriptionInfoEntity.state;
    }
    {
      _requestInfoEntity.requestEconomicInfoEntity.agreedNegotiation =
          requestInfoEntity.requestEconomicInfoEntity.agreedNegotiation;
      _requestInfoEntity.requestEconomicInfoEntity.buyingPrice =
          requestInfoEntity.requestEconomicInfoEntity.buyingPrice;
      _requestInfoEntity.requestEconomicInfoEntity.chancePrice =
          requestInfoEntity.requestEconomicInfoEntity.chancePrice;
      _requestInfoEntity.requestEconomicInfoEntity.expectedPrice =
          requestInfoEntity.requestEconomicInfoEntity.expectedPrice;
      _requestInfoEntity.requestEconomicInfoEntity.incommingTime =
          requestInfoEntity.requestEconomicInfoEntity.incommingTime;
      _requestInfoEntity.requestEconomicInfoEntity.investmentMode =
          requestInfoEntity.requestEconomicInfoEntity.investmentMode;
      _requestInfoEntity.requestEconomicInfoEntity.investmentTime =
          requestInfoEntity.requestEconomicInfoEntity.investmentTime;
      _requestInfoEntity.requestEconomicInfoEntity.numberOfChances =
          requestInfoEntity.requestEconomicInfoEntity.numberOfChances;
      _requestInfoEntity.requestEconomicInfoEntity.profitPercent =
          requestInfoEntity.requestEconomicInfoEntity.profitPercent;
      _requestInfoEntity.requestEconomicInfoEntity.propertyManagement =
          requestInfoEntity.requestEconomicInfoEntity.propertyManagement;
      _requestInfoEntity.requestEconomicInfoEntity.rentingPrice =
          requestInfoEntity.requestEconomicInfoEntity.rentingPrice;
      _requestInfoEntity.requestEconomicInfoEntity.totalExpectedTaxes =
          requestInfoEntity.requestEconomicInfoEntity.totalExpectedTaxes;
    }
    {
      _requestInfoEntity.requestImagesInfoEntity.images =
          requestInfoEntity.requestImagesInfoEntity.images
              .map((item) => getCorrectImagePage(item))
              .toList();
      _requestInfoEntity.requestImagesInfoEntity.documents =
          requestInfoEntity.requestImagesInfoEntity.documents
              .map((item) => getCorrectImagePage(item))
              .toList();
      ;
      _requestInfoEntity.requestImagesInfoEntity.ids =
          requestInfoEntity.requestImagesInfoEntity.ids
              .map((item) => getCorrectImagePage(item))
              .toList();
      ;
    }
  }

  RequestInfoEntity getrequestInfoEntity() => _requestInfoEntity;

  GlobalKey<AnimatedListState> getGlobalKey() => _animatedGlobalKey;
  void setAdminNotce(String notce) => _adminNotice = notce;
  String getAdminNotice() => _adminNotice!;
  void setDesicionValue(int value) {
    _desicionValue = value;
  }

  int getDesicionValue() => _desicionValue;

  void setTotalRequestEntity(
    TotalRequestEntity newRequestsEntity,
    bool doClean,
  ) async {
    _totalRequestEntity.nextPage = newRequestsEntity.nextPage;
    if (doClean) {
      _totalRequestEntity.requests.clear();
    }
    for (RequestEntity item in newRequestsEntity.requests.reversed) {
      await Future.delayed(Duration(milliseconds: 150));
      _totalRequestEntity.requests.add(item);
      _animatedGlobalKey.currentState!.insertItem(
        _totalRequestEntity.requests.length - 1,
      );
    }
    _totalRequestEntity.nextPage = newRequestsEntity.nextPage;
  }

  TotalRequestEntity getTotalRequestEntity() => _totalRequestEntity;
  String getCorrectImagePage(String path) =>
      NetworkApisRouts().getBaseUrl() + path;

  void viewImages(BuildContext context, List<String> images) {
    final PageController pageController = PageController(initialPage: 0);
    int currentIndex = 0;
    showDialog(
      context: context,
      builder:
          (context) => Dialog(
            child: Container(
              decoration: BoxDecoration(
                gradient: mainGradient,
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PhotoViewGallery.builder(
                    backgroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: mainGradient1,
                      border: Border.all(color: linkColor),
                    ),
                    scrollPhysics: const BouncingScrollPhysics(),
                    builder: (BuildContext context, int index) {
                      return PhotoViewGalleryPageOptions(
                        imageProvider: NetworkImage(images[index]),
                        initialScale: PhotoViewComputedScale.contained * 0.8,
                        heroAttributes: PhotoViewHeroAttributes(
                          tag: images[index],
                        ),
                      );
                    },
                    itemCount: images.length,
                    pageController: pageController,
                  ),
                  Positioned(
                    left: 10,
                    top: 10,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.dangerous_rounded,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    child: IconButton(
                      onPressed: () {
                        if (currentIndex > 0) {
                          pageController.previousPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: Icon(Icons.arrow_back_ios, color: Colors.black38),
                    ),
                  ),
                  Positioned(
                    right: 10,

                    child: IconButton(
                      onPressed: () {
                        if (currentIndex < images.length - 1) {
                          pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black38,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void showGetRequestsFailedMessage(BuildContext context, RequestsState state) {
    if (state is FailedGetAllRequestsState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showViewRequestsFailedMessage(
    BuildContext context,
    RequestInfoState state,
  ) {
    if (state is FailedViewRequestInfoState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedAcceptPropertyRequestState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedRejectPropertyRequestState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is SuccessAcceptPropertyRequestState ||
        state is SuccessRejectPropertyRequestState) {
      context.read<ChangePageBloc>().add(
        MoveToRequestsPageEvent(title: 'Requests'),
      );
    }
  }

  void sendAdminDesicion(RequestInfoBloc bloc, int id) {
    if (_desicionValue == 0) {
      bloc.add(AcceptPropertyRequestEvent(id: id));
    } else {
      bloc.add(RejectPropertyRequestEvent(id: id));
    }
  }

  String? getNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length <= 2) {
      return 'should be more than 2 characters';
    } else {
      return null;
    }
  }

  Either<Widget, Widget> getCorrectWidget(RequestsState state, Size size) {
    if (state is LoadingGetAllRequestsState) {
      return right(ListSearchShimmer(size: size));
    } else if (state is SuccessGetAllRequestsState && tempList.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedGetAllRequestsState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else {
      return left(const SizedBox());
    }
  }
}
