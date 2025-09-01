import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/item_list_widget.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_list_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_money/transfer_money_bloc.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:admin_dashboard/util/font/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AnimatedTransferMoneyList extends StatelessWidget {
  Size size;
  GlobalKey<AnimatedListState> globalKey;
  TransferMoneyListEntity transferMoneyListEntity;
  AnimatedTransferMoneyList({
    required this.size,
    required this.globalKey,
    required this.transferMoneyListEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferMoneyBloc, TransferMoneyState>(
      builder:
          (context, state) => context
              .read<TransferMoneyBloc>()
              .transferMoneyMiddleware
              .getTransferMoneyCorrectWidget(state, size)
              .fold(
                (_) => SizedBox(
                  height: size.height * .76,
                  width: size.width * .8,
                  child: NotificationListener(
                    onNotification: (ScrollNotification notification) {
                      if (notification.metrics.pixels ==
                          notification.metrics.maxScrollExtent) {}
                      return false;
                    },
                    child: AnimatedList(
                      physics: BouncingScrollPhysics(),
                      key: globalKey,
                      initialItemCount: transferMoneyListEntity.requests.length,
                      shrinkWrap: true,
                      itemBuilder:
                          (context, index, animation) => FadeTransition(
                            opacity: animation.drive(
                              Tween<double>(begin: 0, end: 1),
                            ),
                            child: ItemListWidget(
                              name:
                                  transferMoneyListEntity
                                      .requests[index]
                                      .fullName,
                              size: size,
                              status: [
                                Text(
                                  transferMoneyListEntity
                                      .requests[index]
                                      .createdAt,
                                  style: getTransferMoneyStatusStyle(
                                    size,
                                    black30,
                                  ),
                                ),
                              ],
                              onPressed:
                                  () => context.read<ChangePageBloc>().add(
                                    MoveToViewTransferRequestsPageEvent(
                                      title: 'Transfer Money',
                                      transferMoneyEntity:
                                          transferMoneyListEntity
                                              .requests[index],
                                    ),
                                  ),
                            ),
                          ),
                    ),
                  ),
                ),
                (widget) => widget,
              ),
    );
  }
}
