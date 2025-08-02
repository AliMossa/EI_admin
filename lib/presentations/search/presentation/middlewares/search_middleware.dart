import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_result_entity.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:admin_dashboard/presentations/search/presentation/logic/bloc/search_bloc.dart';
import 'package:admin_dashboard/presentations/search/presentation/logic/cubit/search_types_cubit.dart';
import 'package:admin_dashboard/presentations/search/presentation/models/search_type_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class SearchMiddleware {
  int _currentSearchTypeValue = 0;
  List<SearchResultEntity> temp = [];
  final GlobalKey<AnimatedListState> _animatedListGlobalKey =
      GlobalKey<AnimatedListState>();
  SearchTotalEntity _searchList = SearchTotalEntity.init();
  String _searchName = '';
  String _motherName = '';
  String _fatherName = '';
  final List<SearchTypeModel> _listOfTypes = [
    SearchTypeModel(id: 2, name: 'Lawyers Team'),
    SearchTypeModel(id: 1, name: 'Expert Team'),
    SearchTypeModel(id: 0, name: 'Users'),
  ];
  void setSearchList(SearchTotalEntity searchTotalEntity, bool doClear) async {
    _searchList.link = searchTotalEntity.link;
    if (doClear) {
      _searchList.list.clear();
    }
    for (SearchResultEntity item in searchTotalEntity.list) {
      await Future.delayed(Duration(milliseconds: 250));
      _searchList.list.add(item);
      _animatedListGlobalKey.currentState!.insertItem(
        _searchList.list.length - 1,
      );
    }
  }

  void clearSearchList() => _searchList.list.clear();

  SearchTotalEntity getSearchList() => _searchList;
  GlobalKey<AnimatedListState> getAnimatedListGlobalKey() =>
      _animatedListGlobalKey;
  void setSearchName(String name) => _searchName = name;
  void setSearchFatherName(String name) => _fatherName = name;
  void setSearchMotherName(String name) => _motherName = name;

  List<SearchTypeModel> getListOfTypes() => _listOfTypes;
  int getCurrentSearchTypeValue() => _currentSearchTypeValue;

  void changeTeamKind(int type, SearchTypesCubit cubit) {
    _currentSearchTypeValue = type;
    cubit.changeType();
  }

  SearchEntity getSearchVariables() => SearchEntity(
    roleId: _currentSearchTypeValue + 2,
    name: _searchName,
    fatherName: _fatherName,
    motherName: _motherName,
  );
  void showSearchFailedMessage(BuildContext context, SearchState state) {
    if (state is FailedSendSearchState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  Either<Widget, Widget> getCorrectWidget(SearchState state, Size size) {
    if (state is LoadingSendSearchState) {
      return right(ListSearchShimmer(size: size));
    } else if (state is SuccessSendSearchState && temp.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedSendSearchState) {
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
