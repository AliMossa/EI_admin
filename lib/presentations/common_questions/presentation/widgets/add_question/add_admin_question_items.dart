import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/add_admin_question/add_admin_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/add_question/add_admin_list_items_widget.dart';

import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddAdminQuestionItems extends StatelessWidget {
  const AddAdminQuestionItems({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocListener<AddAdminQuestionBloc, AddAdminQuestionState>(
      listener: (context, state) {
        if (state is SuccessAddAdminCommonQuestionState) {
          context.read<ChangePageBloc>().add(
            MoveToQuestionsPageEvent(title: 'Questions'),
          );
        }
      },
      child: BlocBuilder<ChangePageBloc, ChangePageState>(
        builder:
            (context, state) => AnimatedOpacity(
              opacity: state is MoveToAddAdminCommonQuestionPageState ? 1 : 0,
              duration: Duration(milliseconds: 500),
              child:
                  state is MoveToAddAdminCommonQuestionPageState
                      ? AddAdminListItemsWidget()
                      : SizedBox(),
            ),
      ),
    );
  }
}
