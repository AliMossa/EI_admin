import 'package:admin_dashboard/presentations/search/presentation/logic/cubit/search_types_cubit.dart';
import 'package:admin_dashboard/presentations/search/presentation/models/search_type_model.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchTypeDropDownWidget extends StatelessWidget {
  int currntValue;
  final onPressed;
  Widget underline;
  Size size;
  List<SearchTypeModel> kinds;
  SearchTypeDropDownWidget({
    this.underline = const SizedBox(),
    required this.kinds,
    required this.currntValue,
    required this.onPressed,
    required this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchTypesCubit, SearchTypesState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: DropdownButton(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),

            underline: underline,
            iconEnabledColor: selecteSideBarItem2,
            enableFeedback: true,
            value: state is ChangeSearchTypeState ? currntValue : 0,
            items:
                kinds
                    .map(
                      (item) => DropdownMenuItem(
                        value: item.id,
                        child: Text(
                          item.name,
                          style: getProfileTitleLogginDateStyle(size),
                        ),
                      ),
                    )
                    .toList(),
            onChanged: (value) => onPressed(value),
          ),
        );
      },
    );
  }
}
