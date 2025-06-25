import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_list_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/property_request_entity.dart';
import 'package:admin_dashboard/presentations/properties/domain/entities/view_property_entity.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/desicion/cubit/properties_types_cubit.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/properties/properties_bloc.dart';
import 'package:admin_dashboard/presentations/properties/presentation/logic/view_property/view_property_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/util/apis/network_apis_routs.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

int _propertiesTypes = 0;

class PropertiesMiddlewar {
  int _currentValue = 0;
  PropertiesMiddlewar? _propertiesMiddlewar;
  ViewPropertyEntity _viewPropertyEntity = ViewPropertyEntity.init();
  PropertiesMiddlewar get() =>
      _propertiesMiddlewar ?? (_propertiesMiddlewar = PropertiesMiddlewar());
  final GlobalKey<AnimatedListState> _propertyGlobalKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _soldPropertyGlobalKey =
      GlobalKey<AnimatedListState>();
  PropertyListEntity _propertyListEntity = PropertyListEntity.init();
  PropertyListEntity _soldPropertyListEntity = PropertyListEntity.init();

  List<PropertyRequestEntity> tempProperties = [];
  List<PropertyRequestEntity> tempSoldProperties = [];

  GlobalKey<AnimatedListState> getPropertyGlobalKey() => _propertyGlobalKey;
  PropertyListEntity getAprropriatePropertyListEntity() =>
      _currentValue == 0 ? _propertyListEntity : _soldPropertyListEntity;

  int getCurrentValue() => _currentValue;
  int getPropertiesTypes() => _propertiesTypes;

  void setCurrentValue(int newValue) => _currentValue = newValue;
  void setPropertiesTypes(int newValue) => _propertiesTypes = newValue;

  void setPropertyListEntity(
    PropertyListEntity newPropertyListEntity,
    bool doClean,
  ) async {
    _propertyListEntity.nextPage = newPropertyListEntity.nextPage;
    if (doClean) {
      _propertyListEntity.list.clear();
    }
    for (PropertyRequestEntity item in newPropertyListEntity.list) {
      await Future.delayed(const Duration(milliseconds: 250));
      _propertyListEntity.list.add(item);
      _propertyGlobalKey.currentState!.insertItem(
        _propertyListEntity.list.length - 1,
      );
    }
  }

  void setSoldPropertyListEntity(
    PropertyListEntity newSoldPropertyListEntity,
    bool doClean,
  ) async {
    _soldPropertyListEntity.nextPage = newSoldPropertyListEntity.nextPage;
    if (doClean) {
      _soldPropertyListEntity.list.clear();
    }
    for (PropertyRequestEntity item in newSoldPropertyListEntity.list) {
      await Future.delayed(const Duration(milliseconds: 250));
      _soldPropertyListEntity.list.add(item);
      _soldPropertyGlobalKey.currentState!.insertItem(
        _soldPropertyListEntity.list.length - 1,
      );
    }
  }

  void getCorrectProperties(PropertiesTypesCubit cubit) {
    if (_currentValue == 0) {}
  }

  ViewPropertyEntity getViewPropertyEntity() => _viewPropertyEntity;

  void setViewPropertyEntity(ViewPropertyEntity viewPropertyEntity) {
    {
      _viewPropertyEntity.requestDescriptionInfoEntity.areaSize =
          viewPropertyEntity.requestDescriptionInfoEntity.areaSize;
      _viewPropertyEntity.requestDescriptionInfoEntity.balconySize =
          viewPropertyEntity.requestDescriptionInfoEntity.balconySize;
      _viewPropertyEntity.requestDescriptionInfoEntity.bathroomNumbers =
          viewPropertyEntity.requestDescriptionInfoEntity.bathroomNumbers;
      _viewPropertyEntity.requestDescriptionInfoEntity.contract =
          viewPropertyEntity.requestDescriptionInfoEntity.contract;
      _viewPropertyEntity.requestDescriptionInfoEntity.decoration =
          viewPropertyEntity.requestDescriptionInfoEntity.decoration;
      _viewPropertyEntity.requestDescriptionInfoEntity.exactPosition =
          viewPropertyEntity.requestDescriptionInfoEntity.exactPosition;
      _viewPropertyEntity.requestDescriptionInfoEntity.flooringType =
          viewPropertyEntity.requestDescriptionInfoEntity.flooringType;
      _viewPropertyEntity.requestDescriptionInfoEntity.kitchenType =
          viewPropertyEntity.requestDescriptionInfoEntity.kitchenType;
      _viewPropertyEntity.requestDescriptionInfoEntity.legalCheck =
          viewPropertyEntity.requestDescriptionInfoEntity.legalCheck;
      _viewPropertyEntity.requestDescriptionInfoEntity.areaSize =
          viewPropertyEntity.requestDescriptionInfoEntity.areaSize;
      _viewPropertyEntity.requestDescriptionInfoEntity.overlook =
          viewPropertyEntity.requestDescriptionInfoEntity.overlook;
      _viewPropertyEntity.requestDescriptionInfoEntity.paintingType =
          viewPropertyEntity.requestDescriptionInfoEntity.paintingType;
      _viewPropertyEntity.requestDescriptionInfoEntity.payWay =
          viewPropertyEntity.requestDescriptionInfoEntity.payWay;
      _viewPropertyEntity.requestDescriptionInfoEntity.price =
          viewPropertyEntity.requestDescriptionInfoEntity.price;
      _viewPropertyEntity.requestDescriptionInfoEntity.propertyAge =
          viewPropertyEntity.requestDescriptionInfoEntity.propertyAge * 999999;
      _viewPropertyEntity.requestDescriptionInfoEntity.propertyType =
          viewPropertyEntity.requestDescriptionInfoEntity.propertyType;
      _viewPropertyEntity.requestDescriptionInfoEntity.roomNumbers =
          viewPropertyEntity.requestDescriptionInfoEntity.roomNumbers;
      _viewPropertyEntity.requestDescriptionInfoEntity.userId =
          viewPropertyEntity.requestDescriptionInfoEntity.userId;
      _viewPropertyEntity.requestDescriptionInfoEntity.state =
          viewPropertyEntity.requestDescriptionInfoEntity.state;
      _viewPropertyEntity.requestDescriptionInfoEntity.status =
          viewPropertyEntity.requestDescriptionInfoEntity.status;
    }
    {
      _viewPropertyEntity.requestImagesInfoEntity.images =
          viewPropertyEntity.requestImagesInfoEntity.images
              .map((item) => getCorrectImagePage(item))
              .toList();
      _viewPropertyEntity.requestImagesInfoEntity.documents =
          viewPropertyEntity.requestImagesInfoEntity.documents
              .map((item) => getCorrectImagePage(item))
              .toList();
      ;
      _viewPropertyEntity.requestImagesInfoEntity.ids =
          viewPropertyEntity.requestImagesInfoEntity.ids
              .map((item) => getCorrectImagePage(item))
              .toList();
      ;
    }
  }

  String getCorrectImagePage(String path) =>
      NetworkApisRouts().getBaseUrl() + path;
  bool getCorrectAnimatedListItem(PropertiesState state) =>
      state is SuccessGetPropertiesState && tempProperties.isEmpty
          ? true
          : false;

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

  void sendPropertyDesicion(ViewPropertyBloc bloc, int id) {
    switch (id) {
      case 0:
        bloc.add(SetPropertySoldEvent(id: id));
        break;
      case 1:
        bloc.add(NewPropertyStudyEvent(id: id));
        break;
    }
  }

  void showState(BuildContext context, ViewPropertyState state) {
    print(state);

    if (state is SuccessNewPropertyStudyState ||
        state is SuccessSetPropertySoldState) {
      context.read<ChangePageBloc>().add(
        MoveToPropertiesPageEvent(title: 'Properties'),
      );
    } else if (state is FailedNewPropertyStudyState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedSetPropertySoldState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  Either<Widget, Widget> showCorrectImage(
    PropertiesBloc bloc,
    PropertiesState state,
    Size size,
  ) {
    if (state is LoadingGetPropertiesState ||
        state is LoadingGetSoldPropertiesState) {
      return right(ListSearchShimmer(size: size));
    } else if ((state is SuccessGetPropertiesState && tempProperties.isEmpty) ||
        (state is SuccessGetSoldPropertiesState &&
            tempSoldProperties.isEmpty)) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedGetPropertiesState ||
        state is FailedGetSoldPropertiesState) {
      return right(SvgPicture.asset(Assets.images.error));
    } else if (state is GetCorrectPropertiesState) {
      getCorrectList(bloc);
      return right(SizedBox());
    } else {
      return left(const SizedBox());
    }
  }

  void getCorrectList(PropertiesBloc bloc) {
    _propertiesTypes == 0
        ? bloc.add(GetPropertiesEvent())
        : bloc.add(GetSoldPropertiesEvent());
  }
}
