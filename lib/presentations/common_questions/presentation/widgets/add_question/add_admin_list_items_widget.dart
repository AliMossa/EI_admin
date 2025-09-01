import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/add_admin_question/add_admin_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/add_question/add_question_answer_textfield_widget.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/widgets/add_question/add_question_question_textfield_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/add_item_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class AddAdminListItemsWidget extends StatelessWidget {
  const AddAdminListItemsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final moreInfo = MediaQuery.sizeOf(context);
    return BlocConsumer<AddAdminQuestionBloc, AddAdminQuestionState>(
      builder: (context, state) {
        return Container(
          width: moreInfo.width * .5,
          decoration: BoxDecoration(
            color: background,
            border: Border.all(color: textFieldBorder),
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              AddQuestionQuestionTextfieldWidget(
                widthSizeFactor: .8,
                size: moreInfo,
                nextFocusNode:
                    context
                        .watch<AddAdminQuestionBloc>()
                        .commonQuestionMiddleware
                        .getAnswerFocusNode(),
                focusNode: FocusNode(),
                title: 'question',
              ),
              AddQuestionAnswerTextfieldWidget(
                widthSizeFactor: .8,
                size: moreInfo,
                nextFocusNode: FocusNode(),
                focusNode:
                    context
                        .watch<AddAdminQuestionBloc>()
                        .commonQuestionMiddleware
                        .getAnswerFocusNode(),
                title: 'answer',
              ),
              state is LoadingAddAdminCommonQuestionState
                  ? LoadingWidget()
                  : AddItemButtonWidget(
                    heightFactor: 50,
                    widthFactor: .14,
                    onPress:
                        () => context.read<AddAdminQuestionBloc>().add(
                          AddAdminCommonQuestionEvent(),
                        ),
                    size: moreInfo,
                    title: 'add',
                  ),
            ],
          ),
        );
      },
      listener:
          (BuildContext context, AddAdminQuestionState state) => context
              .read<AddAdminQuestionBloc>()
              .commonQuestionMiddleware
              .showAddCommonQuestionState(context, state),
    );
  }
}
