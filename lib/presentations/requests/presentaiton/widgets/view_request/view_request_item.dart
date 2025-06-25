import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/request_info/request_info_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/view_request/view_request_items_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewRequestItem extends StatelessWidget {
  const ViewRequestItem({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<RequestInfoBloc, RequestInfoState>(
      listener:
          (context, state) => context
              .read<RequestInfoBloc>()
              .requestMiddleware
              .showViewRequestsFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToViewRequestsPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToViewRequestsPageState
                    ? ViewRequestItemsInfo(
                      requestInfoEntity:
                          context
                              .read<RequestInfoBloc>()
                              .requestMiddleware
                              .getrequestInfoEntity(),
                      size: moreInfo,
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
