import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/legal_study_status_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/re_study_status_widget.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/request_entity.dart';
import 'package:admin_dashboard/presentations/requests/domain/entities/total_request_entity.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/requests/requests_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

// ignore: must_be_immutable
class PeopertyListItem extends StatelessWidget {
  Size size;
  TotalRequestEntity totalRequestEntity;
  List<RequestEntity> tempList;
  GlobalKey<AnimatedListState> animatedKey;
  PeopertyListItem({
    required this.totalRequestEntity,
    required this.size,
    required this.tempList,
    required this.animatedKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestsBloc, RequestsState>(
      builder: (context, state) {
        return context
            .read<RequestsBloc>()
            .requestMiddleware
            .getCorrectWidget(state, size)
            .fold(
              (_) => SizedBox(
                height: size.height * .83,
                width: size.width * .8,
                child: NotificationListener(
                  onNotification: (ScrollNotification notification) {
                    if (notification.metrics.pixels ==
                        notification.metrics.maxScrollExtent) {}
                    return false;
                  },
                  child: AnimatedList(
                    key: animatedKey,
                    initialItemCount: totalRequestEntity.requests.length,
                    itemBuilder:
                        (context, index, animation) => FadeTransition(
                          opacity: animation.drive(Tween(begin: 0, end: 1)),
                          child: ItemListWidget(
                            name:
                                'property request in ${totalRequestEntity.requests[index].createdAt}',
                            size: size,
                            status: [
                              LegalStudyStatusWidget(
                                date:
                                    totalRequestEntity
                                        .requests[index]
                                        .lawyerTimeAcceptance,
                                size: size,
                              ),
                              SizedBox(width: 5, height: 5),
                              ReStudyStatusWidget(
                                date:
                                    totalRequestEntity
                                        .requests[index]
                                        .expertTeamTimeAcceptance,
                                size: size,
                              ),
                            ],

                            date: '10-12-2025',
                            onPressed:
                                () => context.read<ChangePageBloc>().add(
                                  MoveToViewRequestsPageEvent(
                                    id: totalRequestEntity.requests[index].id,
                                    title: 'Request',
                                  ),
                                ),
                          ),
                        ),
                  ),
                ),
              ),
              (widget) => widget,
            );
      },
    );
  }
}
