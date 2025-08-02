import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_common_questions_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/total_user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/domain/entities/user_common_question_entity.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/bloc/view_update_question_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/bloc/common_questions_bloc.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/logic/cubit/types_cubit.dart';
import 'package:admin_dashboard/presentations/common_questions/presentation/models/types_drop_down_model.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_cancle_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_ok_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/show_notice_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/util/colors/colors.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

CommonQuestionMiddleware? _commonQuestionMiddleware;
int _questionsTypeValue = 0;

class CommonQuestionMiddleware {
  static CommonQuestionMiddleware get() {
    return _commonQuestionMiddleware ??
        (_commonQuestionMiddleware = CommonQuestionMiddleware());
  }

  List<CommonQuestionsEntity> tempCommonQuestions = [];
  List<UserCommonQuestionEntity> tempUserQuestions = [];
  final GlobalKey<AnimatedListState> _animatedGloblaKey =
      GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> _userAnimatedGloblaKey =
      GlobalKey<AnimatedListState>();

  CommonQuestionsEntity _updateCommonQuestion = CommonQuestionsEntity.init();
  UserCommonQuestionEntity _updateUserCommonQuestion =
      UserCommonQuestionEntity.init();

  String _answer = '';
  String _question = '';
  List list = [];
  GlobalKey<AnimatedListState> getAnimatedGlobalKey() => _animatedGloblaKey;
  GlobalKey<AnimatedListState> getUserAnimatedGlobalKey() =>
      _userAnimatedGloblaKey;

  TotalCommonQuestionsEntity _questionsItems =
      TotalCommonQuestionsEntity.init();
  final FocusNode _answerFocusNode = FocusNode();
  TotalUserCommonQuestionEntity _userQuestionItems =
      TotalUserCommonQuestionEntity.init();
  FocusNode getAnswerFocusNode() => _answerFocusNode;

  final List<TypesDropDownModel> _questionTypes = [
    TypesDropDownModel(id: 0, name: 'common questions'),
    TypesDropDownModel(id: 1, name: 'user questions'),
  ];
  List<TypesDropDownModel> getQuestionsTypes() => _questionTypes;
  void setQuestion(String question) => _question = question;
  void setAnswer(String answer) => _answer = answer;
  void clearQuestionAnswer() {
    _answer = '';
    _question = '';
  }

  String getQuestion() => _question;
  String getAnswer() => _answer;
  void setUpdateCommonQuestion(ChangePageBloc bloc, int id) {
    _updateCommonQuestion = _questionsItems.list.firstWhere(
      (item) => item.id == id,
    );
    bloc.add(MoveToViewCommonQuestionPageEvent(title: 'Question'));
  }

  void setUpdateUserCommonQuestion(ChangePageBloc bloc, int id) {
    _updateUserCommonQuestion = _userQuestionItems.questions.firstWhere(
      (item) => item.id == id,
    );
    bloc.add(MoveToViewCommonQuestionPageEvent(title: 'Question'));
  }

  CommonQuestionsEntity getUpdateCommonQuestion() => _updateCommonQuestion;
  UserCommonQuestionEntity getUserUpdateCommonQuestion() =>
      _updateUserCommonQuestion;

  void setCommonQuestions(
    TotalCommonQuestionsEntity newQuestions,
    bool doClean,
  ) async {
    if (doClean) {
      _questionsItems.list.clear();
    }
    for (CommonQuestionsEntity item in newQuestions.list) {
      await Future.delayed(Duration(milliseconds: 250));
      _questionsItems.list.add(item);
      _animatedGloblaKey.currentState!.insertItem(
        _questionsItems.list.length - 1,
      );
    }
    _questionsItems.nextPage = newQuestions.nextPage;
  }

  void setUserCommonQuestions(
    TotalUserCommonQuestionEntity newQuestions,
    bool doClean,
  ) async {
    if (doClean) {
      _userQuestionItems.questions.clear();
    }

    for (UserCommonQuestionEntity item in newQuestions.questions) {
      await Future.delayed(Duration(milliseconds: 250));
      _userQuestionItems.questions.add(item);
      _userAnimatedGloblaKey.currentState!.insertItem(
        _questionsItems.list.length - 1,
      );
    }
    _userQuestionItems.nextPage = newQuestions.nextPage;
  }

  TotalCommonQuestionsEntity getCommonQuestions() => _questionsItems;
  TotalUserCommonQuestionEntity getUsersCommonQuestions() => _userQuestionItems;

  void changeQuestionsType(int value, TypesCubit cubit) {
    _questionsTypeValue = value;
    cubit.changeType();
  }

  void getQuestions(CommonQuestionsBloc bloc) {
    _questionsTypeValue == 0
        ? bloc.add(GetAdminCommonQuestionsEvent())
        : bloc.add(GetUserCommonQuestionsEvent());
  }

  int getQuestionsTypeValue() => _questionsTypeValue;
  void removeCommonQuestionItem(int id) => _questionsItems.list.remove(
    _questionsItems.list.firstWhere((item) => item.id == id),
  );

  void removeCommonQuestionNotice(
    BuildContext context,
    CommonQuestionsBloc bloc,
    CommonQuestionsState state,
    ChangePageBloc pageBloc,
    int id,
  ) {
    ShowNoticeWidget.showNotice(
      context,
      Text('Remove'),
      Text('Do you want to remove this item?'),
      state is LoadingRemoveAdminCommonQuestionState
          ? Center(child: CircularProgressIndicator(color: textFieldBorder))
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NoticeOkButtonWidget(
                title: 'yes',
                function: () {
                  bloc.add(RemoveAdminCommonQuestionEvent(id: id));
                  pageBloc.add(MoveToQuestionsPageEvent(title: 'Questions'));
                  Navigator.of(context).pop();
                },
              ),
              NoticeCancleButtonWidget(),
            ],
          ),
      Icon(Icons.info_outline_rounded, color: cancleColor),
    );
  }

  void removeUserCommonQuestionNotice(
    BuildContext context,
    CommonQuestionsBloc bloc,
    CommonQuestionsState state,
    int id,
  ) {
    ShowNoticeWidget.showNotice(
      context,
      Text('Remove'),
      Text('Do you want to remove this question?'),
      state is LoadingRemoveUserCommonQuestionState
          ? Center(child: CircularProgressIndicator(color: textFieldBorder))
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NoticeOkButtonWidget(
                title: 'yes',
                function: () {
                  bloc.add(RemoveUserCommonQuestionEvent(id: id));
                  bloc.add(GetUserCommonQuestionsEvent());
                  ;
                  Navigator.of(context).pop();
                },
              ),
              NoticeCancleButtonWidget(),
            ],
          ),
      Icon(Icons.info_outline_rounded, color: cancleColor),
    );
  }

  void removeCommonQuestionNoticeFromInside(
    BuildContext context,
    ViewUpdateQuestionBloc bloc,
    ViewUpdateQuestionState state,
    ChangePageBloc pageBloc,
    int id,
  ) {
    ShowNoticeWidget.showNotice(
      context,
      Text('Remove'),
      Text('Do you want to remove this item?'),
      state is LoadingRemoveAdminCommonQuestionState
          ? Center(child: CircularProgressIndicator(color: textFieldBorder))
          : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NoticeOkButtonWidget(
                title: 'yes',
                function: () {
                  bloc.add(RemoveAdminCommonQuestionFromInsidEvent(id: id));
                  pageBloc.add(
                    MoveToQuestionsPageEvent(title: 'Common Questions'),
                  );
                  Navigator.of(context).pop();
                },
              ),
              NoticeCancleButtonWidget(),
            ],
          ),
      Icon(Icons.info_outline_rounded, color: cancleColor),
    );
  }

  void showCurrentState(BuildContext context, CommonQuestionsState state) {
    if (state is StartGetSuitalbeCommonQuestionsState) {
      getQuestions(context.read<CommonQuestionsBloc>());
    }
    if (state is SuccessRemoveAdminCommonQuestionState) {
      context.read<ChangePageBloc>().add(
        MoveToQuestionsPageEvent(title: 'Questions'),
      );
      getQuestions(context.read<CommonQuestionsBloc>());
    }
  }

  void showCurrentStateInTypes(BuildContext context, TypesState state) {
    if (state is ChangeTypesState) {
      getQuestions(context.read<CommonQuestionsBloc>());
    }
  }

  Either<Widget, Widget> checkUserQuestionTemp(
    CommonQuestionsState state,
    Size size,
  ) {
    if (state is LoadingGetUserCommonQuestionsState) {
      return right(ListSearchShimmer(size: size));
    } else if (tempUserQuestions.isEmpty &&
        state is SuccessGetUserCommonQuestionsState) {
      return right(SvgPicture.asset(Assets.images.empty, fit: BoxFit.contain));
    } else if (state is FailedGetUserCommonQuestionsState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else {
      return left(SizedBox());
    }
  }

  Either<Widget, Widget> checkAdminQuestionTemp(
    CommonQuestionsState state,
    Size size,
  ) {
    if (state is LoadingGetAdminCommonQuestionsState) {
      return right(ListSearchShimmer(size: size));
    } else if (tempCommonQuestions.isEmpty &&
        state is SuccessGetAdminCommonQuestionsState) {
      return right(SvgPicture.asset(Assets.images.empty, fit: BoxFit.contain));
    } else if (state is FailedGetAdminCommonQuestionsState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else {
      return left(SizedBox());
    }
  }
}
