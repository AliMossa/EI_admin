import 'package:admin_dashboard/presentations/search/presentation/logic/bloc/search_bloc.dart';
import 'package:admin_dashboard/presentations/search/presentation/logic/cubit/search_types_cubit.dart';
import 'package:admin_dashboard/presentations/search/presentation/wdgets/search_type_drop_down_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:admin_dashboard/util/sizes/fonts_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class SearchBarFieldWidget extends StatelessWidget {
  Size size;
  SearchBarFieldWidget({required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .8,
      height: 50,
      padding: EdgeInsets.only(left: 5, right: 5),
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: linkColor),
        color: textFieldInside,
      ),
      child: Row(
        children: [
          SearchTypeDropDownWidget(
            size: size,
            currntValue:
                context
                    .watch<SearchTypesCubit>()
                    .searchMiddleware
                    .getCurrentSearchTypeValue(),
            kinds:
                context
                    .read<SearchTypesCubit>()
                    .searchMiddleware
                    .getListOfTypes(),
            underline: SizedBox(),
            onPressed:
                (value) => context
                    .read<SearchTypesCubit>()
                    .searchMiddleware
                    .changeTeamKind(value, context.read<SearchTypesCubit>()),
          ),
          Expanded(
            child: TextFormField(
              enableSuggestions: true,
              style: getProfileTitleLogginDateStyle(size),
              onFieldSubmitted:
                  (_) => context.read<SearchBloc>().add(SendSearchEvent()),
              onChanged:
                  (value) => context
                      .read<SearchBloc>()
                      .searchMiddleware
                      .setSearchName(value),
              autofocus: true,
              cursorHeight: smallSize,
              decoration:
                  context
                              .watch<SearchTypesCubit>()
                              .searchMiddleware
                              .getCurrentSearchTypeValue() ==
                          0
                      ? InputDecoration(
                        suffix: IconButton(
                          onPressed:
                              () => context.read<SearchBloc>().add(
                                SendSearchEvent(),
                              ),
                          icon: Icon(Icons.search_rounded),
                        ),
                        border: InputBorder.none,
                        label: Text(
                          'Search',
                          style: getVariableTitleStyle(size),
                        ),
                      )
                      : InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'Search',
                          style: getVariableTitleStyle(size),
                        ),
                      ),
            ),
          ),
          if (context
                  .watch<SearchTypesCubit>()
                  .searchMiddleware
                  .getCurrentSearchTypeValue() !=
              0)
            SizedBox(
              width: size.width * .4,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: VerticalDivider(thickness: 2),
                  ),
                  Expanded(
                    child: TextFormField(
                      enableSuggestions: true,
                      style: getProfileTitleLogginDateStyle(size),
                      onFieldSubmitted:
                          (_) =>
                              context.read<SearchBloc>().add(SendSearchEvent()),
                      onChanged:
                          (value) => context
                              .read<SearchBloc>()
                              .searchMiddleware
                              .setSearchFatherName(value),
                      autofocus: true,
                      cursorHeight: smallSize,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'father name',
                          style: getVariableTitleStyle(size),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: VerticalDivider(thickness: 2),
                  ),
                  Expanded(
                    child: TextFormField(
                      enableSuggestions: true,
                      style: getProfileTitleLogginDateStyle(size),
                      onFieldSubmitted:
                          (_) =>
                              context.read<SearchBloc>().add(SendSearchEvent()),
                      onChanged:
                          (value) => context
                              .read<SearchBloc>()
                              .searchMiddleware
                              .setSearchMotherName(value),
                      autofocus: true,
                      cursorHeight: smallSize,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        label: Text(
                          'mother name',
                          style: getVariableTitleStyle(size),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed:
                        () => context.read<SearchBloc>().add(SendSearchEvent()),
                    icon: Icon(Icons.search_rounded),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
