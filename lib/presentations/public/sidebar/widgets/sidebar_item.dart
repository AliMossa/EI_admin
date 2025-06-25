import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/sidebar/middleware/sidebar_middleware.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../logic/change_selected_color_item/cubit/change_selected_color_cubit.dart';

// ignore: must_be_immutable
class SidebarItem extends StatelessWidget {
  int index;
  int selectedIndex = -1;
  String title;
  final onClicked;
  final icon;
  SidebarMiddleware middleware = SidebarMiddleware();
  SidebarItem({
    required this.index,
    required this.title,
    required this.icon,
    required this.onClicked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePageBloc, ChangePageState>(
      builder: (context, pageState) {
        return BlocConsumer<ChangeSelectedColorCubit, ChangeSelectedColorState>(
          listener: (context, state) {
            if (state is ChangeColorSelectedItemState) {
              selectedIndex = state.index;
            }
          },
          builder:
              (context, state) => InkWell(
                onTap: onClicked,
                child:
                    context
                            .watch<ChangeSelectedColorCubit>()
                            .sidebarMiddleware
                            .checkCorrectColor(pageState)
                        ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          margin: const EdgeInsets.only(top: 3),
                          child: ListTile(
                            onTap: onClicked,
                            title: Text(
                              overflow: TextOverflow.ellipsis,
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selecteSideBarItem1,
                              ),
                            ),
                            leading: Icon(icon, color: selecteSideBarItem1),
                          ),
                        )
                        : Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: middleware.getAroundSelectedItem(
                              index,
                              state is ChangeColorSelectedItemState
                                  ? state.index
                                  : -1,
                              pageState,
                            ),
                          ),
                          margin: const EdgeInsets.only(top: 3),
                          child: ListTile(
                            onTap: onClicked,
                            title: Text(
                              overflow: TextOverflow.ellipsis,
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: middleware.getInsideSelectedItem(
                                  index,
                                  state is ChangeColorSelectedItemState
                                      ? state.index
                                      : -1,
                                  pageState,
                                ),
                              ),
                            ),
                            leading: Icon(
                              icon,
                              color: middleware.getInsideSelectedItem(
                                index,
                                state is ChangeColorSelectedItemState
                                    ? state.index
                                    : -1,
                                pageState,
                              ),
                            ),
                          ),
                        ),
              ),
        );
      },
    );
  }
}
