import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/requests/presentaiton/models/drop_down_desicion_model.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/about_user_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/tansfer_money_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/domain/entities/transfer_money_list_entity.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/add_deposit/add_deposit_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_type/transfer_type_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/transfer_money/transfer_money_bloc.dart';
import 'package:admin_dashboard/presentations/transfer_money/presentation/logic/view_transfer_money/view_transfer_money_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

int _selectedTransferMoneyType = 0;

class TransferMoneyMiddleware {
  int _selectedTransferMoneyDecision = 0;
  num _depositAmount = 0;
  String _transferMoneyText = '';
  String _searchAboutUserText = '';
  final GlobalKey<FormState> _globalFromKey = GlobalKey<FormState>();
  final GlobalKey<AnimatedListState> _globalKey =
      GlobalKey<AnimatedListState>();
  List<TransferMoneyEntity> tempRequests = [];
  TransferMoneyListEntity _transferMoneyListEntity =
      TransferMoneyListEntity.init();
  TransferMoneyEntity _TransferMoneyEntity = TransferMoneyEntity.init();
  AboutUserEntity _aboutUserEntity = AboutUserEntity.init();
  set(int value) => _selectedTransferMoneyType = value;
  get() => _selectedTransferMoneyType;
  void setSelectedTransferMoneyDecision(int decision) =>
      _selectedTransferMoneyDecision = decision;
  int getSelectedTransferMoneyDecision() => _selectedTransferMoneyDecision;
  void setDepositAmount(int depositAmount) => _depositAmount = depositAmount;
  num getDepositAmount() => _depositAmount;
  setTransferMoneyText(String text) => _transferMoneyText = text;
  String getTransferMoneyText() => _transferMoneyText;
  setSearchAboutUserText(String text) => _searchAboutUserText = text;
  String getSearchAboutUserText() => _searchAboutUserText;
  AboutUserEntity getAboutUserEntity() => _aboutUserEntity;
  TransferMoneyEntity getTransferMoneyEntity() => _TransferMoneyEntity;
  setTransferMoneyEntity(TransferMoneyEntity transferMoney) {
    _TransferMoneyEntity.id = transferMoney.id;
    _TransferMoneyEntity.userId = transferMoney.userId;
    _TransferMoneyEntity.fullName = transferMoney.fullName;
    _TransferMoneyEntity.phone = transferMoney.phone;
    _TransferMoneyEntity.amount = transferMoney.amount;
    _TransferMoneyEntity.method = transferMoney.method;
    _TransferMoneyEntity.createdAt = transferMoney.createdAt;
  }

  setAboutUserEntity(AboutUserEntity aboutUserEntity) {
    _aboutUserEntity.userId = aboutUserEntity.userId;
    _aboutUserEntity.name = aboutUserEntity.name;
    _aboutUserEntity.phone = aboutUserEntity.phone;
    _aboutUserEntity.email = aboutUserEntity.email;
  }

  String getTransferType() => DropDownDesicionModel()
      .getTransferRequestsList()
      .firstWhere((item) => item.id == _selectedTransferMoneyType)
      .state
      .toLowerCase() // Convert to lowercase
      .replaceAll(' ', '_');
  setTransferMoneyListEntity(
    TransferMoneyListEntity transferMoneyListEntity,
  ) async {
    _transferMoneyListEntity.requests.clear();
    for (TransferMoneyEntity item
        in transferMoneyListEntity.requests.reversed) {
      await Future.delayed(Duration(milliseconds: 250));
      _transferMoneyListEntity.requests.add(item);
      _globalKey.currentState!.insertItem(
        _transferMoneyListEntity.requests.length - 1,
      );
    }
    _transferMoneyListEntity.nextPage = transferMoneyListEntity.nextPage;
  }

  GlobalKey<AnimatedListState> getGlobalKey() => _globalKey;
  GlobalKey<FormState> getGlobalFromKey() => _globalFromKey;
  TransferMoneyListEntity getTransferMoneyListEntity() =>
      _transferMoneyListEntity;

  void changeTransferType(
    TransferMoneyBloc transferBloc,
    TransferTypeBloc typeBloc,
    int type,
  ) {
    typeBloc.add(ChangeTransferTypeEvent(type: type));
    transferBloc.add(GetTransferMoneyRequestsEvent());
  }

  void sendAddDeposit(AddDepositBloc bloc, int userId) {
    if (_globalFromKey.currentState!.validate()) {
      bloc.add(SendAddDepositEvent(userId: userId));
    }
  }

  void getTransferMoneyRequestDesicionState(
    BuildContext context,
    ViewTransferMoneyState state,
  ) {
    if (state is SuccessAcceptTransferMoneyRequestEvent ||
        state is SuccessRejectTransferMoneyRequestEvent) {
      context.read<ChangePageBloc>().add(
        MoveToTransferRequestsPageEvent(title: 'Transfer Money'),
      );
    } else if (state is FailedAcceptTransferMoneyRequestEvent) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedRejectTransferMoneyRequestEvent) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void getAddDecisionState(BuildContext context, AddDepositState state) {
    if (state is FailedSendAddDepositState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void sendCorrectTransferMoneyDecision(ViewTransferMoneyBloc bloc, int id) {
    if (_selectedTransferMoneyDecision == 0) {
      bloc.add(AcceptTransferMoneyRequestEvent(transferMoneyRequestId: id));
    } else {
      bloc.add(RejectTransferMoneyRequestEvent(transferMoneyRequestId: id));
    }
  }

  Either<Widget, Widget> getTransferMoneyDecisionWidget(
    ViewTransferMoneyState state,
    Size size,
  ) {
    if (state is LoadingAcceptTransferMoneyRequestEvent ||
        state is LoadingRejectTransferMoneyRequestEvent) {
      return right(LoadingWidget());
    } else {
      return left(const SizedBox());
    }
  }

  String getDecisionTitleText(int decisionId) =>
      _selectedTransferMoneyDecision == 0
          ? 'transaction number'
          : 'admin notes';
  Either<Widget, Widget> getTransferMoneyCorrectWidget(
    TransferMoneyState state,
    Size size,
  ) {
    if (state is LoadingGetTransferMoneyRequestsState) {
      return right(ListSearchShimmer(size: size));
    } else if (state is FailedGetTransferMoneyRequestsState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else if (state is SuccessGetTransferMoneyRequestsState &&
        tempRequests.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else {
      return left(const SizedBox());
    }
  }

  Either<Widget, Widget> getSearchAboutUserWidget(AddDepositState state) {
    if (state is LoadingSearchAboutUserState ||
        state is LoadingSendAddDepositState) {
      return right(LoadingWidget());
    } else if (_aboutUserEntity.name.isEmpty ||
        state is SuccessSendAddDepositState) {
      return right(const SizedBox());
    } else {
      return left(const SizedBox());
    }
  }
}
