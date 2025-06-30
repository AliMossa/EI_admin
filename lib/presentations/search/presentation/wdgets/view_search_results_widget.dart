import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/joinded_status_widget.dart';
import 'package:admin_dashboard/presentations/search/domain/entities/search_total_entity.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ViewSearchResultsWidget extends StatelessWidget {
  Size size;
  GlobalKey<AnimatedListState> globalKey;
  SearchTotalEntity searchTotalEntity;
  int selectedValue;

  ViewSearchResultsWidget({
    required this.size,
    required this.searchTotalEntity,
    required this.globalKey,
    required this.selectedValue,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),

      child: SizedBox(
        width: size.width * .8,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            if (notification.metrics.pixels ==
                notification.metrics.maxScrollExtent) {}
            return false;
          },
          child: AnimatedList(
            shrinkWrap: true,
            key: globalKey,
            initialItemCount: searchTotalEntity.list.length,
            itemBuilder:
                (context, index, animation) => FadeTransition(
                  opacity: animation.drive<double>(Tween(begin: 0, end: 1)),
                  child: ItemListWidget(
                    name: searchTotalEntity.list[index].name,
                    onPressed:
                        () =>
                            selectedValue == 0
                                ? context.read<ChangePageBloc>().add(
                                  MoveToViewUserPageEvent(
                                    id: searchTotalEntity.list[index].id,
                                    title: 'Employee',
                                  ),
                                )
                                : context.read<ChangePageBloc>().add(
                                  MoveToViewEmployeePageEvent(
                                    id: searchTotalEntity.list[index].id,
                                    title: 'Employee',
                                  ),
                                ),
                    status: [
                      JoindedStatusWidget(
                        date: searchTotalEntity.list[index].joinedDate,
                        size: size,
                      ),
                    ],

                    size: size,
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
