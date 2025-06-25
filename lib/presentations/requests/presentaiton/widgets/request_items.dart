import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/logic/requests/requests_bloc.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/widgets/peoperty_list_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestItems extends StatelessWidget {
  const RequestItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<RequestsBloc, RequestsState>(
      listener:
          (context, state) => context
              .read<RequestsBloc>()
              .requestMiddleware
              .showGetRequestsFailedMessage(context, state),
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder: (context, state) {
          return AnimatedOpacity(
            opacity: state is MoveToRequestsPageState ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInBack,

            child:
                state is MoveToRequestsPageState
                    ? PeopertyListItem(
                      tempList:
                          context
                              .watch<RequestsBloc>()
                              .requestMiddleware
                              .tempList,
                      animatedKey:
                          context
                              .watch<RequestsBloc>()
                              .requestMiddleware
                              .getGlobalKey(),
                      size: moreInfo,
                      totalRequestEntity:
                          context
                              .read<RequestsBloc>()
                              .requestMiddleware
                              .getTotalRequestEntity(),
                    )
                    : SizedBox(),
          );
        },
      ),
    );
  }
}
