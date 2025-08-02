import 'package:admin_dashboard/gen/assets.gen.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/public/main_page/logic/change_page/bloc/change_page_bloc.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/loading_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_cancle_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/notice_ok_button_widget.dart';
import 'package:admin_dashboard/presentations/public/public_widgets/show_notice_widget.dart';
import 'package:admin_dashboard/presentations/public/shimmers/list_search_shimmer.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/add_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/total_user_entity.dart';
import 'package:admin_dashboard/presentations/users/domain/entities/user_entity.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/add_user/add_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/users_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/bloc/view_user/view_user_bloc.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/cubit/active_user_cubit.dart';
import 'package:admin_dashboard/presentations/users/presentation/logic/cubit/type/users_type_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

int _selectedUsersState = 1;

class UserMiddleware {
  UserMiddleware? _userMiddleware;
  List<UserEntity> tempList = [];
  UserMiddleware get() =>
      _userMiddleware ?? (_userMiddleware = UserMiddleware());
  bool _isActive = false;
  String? _fullName;
  String? _email;
  String? _phone;
  String? _password;
  String? _confirmPassword;
  UserEntity _userEntity = UserEntity.init();
  TotalUserEntity _totalUserEntity = TotalUserEntity.init();
  final GlobalKey<AnimatedListState> _animatedListGlobalKey = GlobalKey();
  GlobalKey<AnimatedListState> getAnimatedListGlobalKey() =>
      _animatedListGlobalKey;
  int getSelectedUsersState() => _selectedUsersState;

  void setFullName(String name) => _fullName = name;
  void setEmail(String email) => _email = email;
  void setPhone(String phone) => _phone = phone;
  void setPassword(String password) => _password = password;
  void setConfirmPassword(String confirmPassword) =>
      _confirmPassword = confirmPassword;

  void setUsersList(List<UserEntity> list, bool doClear) async {
    if (doClear) {
      _totalUserEntity.users.clear();
    }
    for (UserEntity item in list.reversed) {
      await Future.delayed(Duration(milliseconds: 150));
      _totalUserEntity.users.add(item);
      _animatedListGlobalKey.currentState!.insertItem(
        _totalUserEntity.users.length - 1,
      );
    }
  }

  bool getIsActive() => _isActive;
  List<UserEntity> getUsersList() => _totalUserEntity.users;
  AddUserEntity getAddUserEntity() => AddUserEntity(
    roleId: 2,
    name: _fullName!,
    email: _email!,
    phone: _phone!,
    password: _password!,
    confirmPassword: _confirmPassword!,
  );
  UserEntity getUserInfo() => _userEntity;
  void setUserInfo(UserEntity userEntity) {
    _userEntity.id = userEntity.id;
    _userEntity.fullName = userEntity.fullName;
    _userEntity.email = userEntity.email;
    _userEntity.phone = userEntity.phone;
    _userEntity.loggedIn = userEntity.loggedIn;
    _isActive = _userEntity.isActive = userEntity.isActive;
  }

  FocusNode? _passwordFocusNode;
  FocusNode? _confirmPasswordFocusNode;
  FocusNode? _emailFocusNode;
  FocusNode? _phoneFocusNode;

  FocusNode getEmailFocusNode() =>
      _emailFocusNode ?? (_emailFocusNode = FocusNode());
  FocusNode getPasswordFocusNode() =>
      _passwordFocusNode ?? (_passwordFocusNode = FocusNode());
  FocusNode getConfirmFocusNode() =>
      _confirmPasswordFocusNode ?? (_confirmPasswordFocusNode = FocusNode());
  FocusNode getPhoneFocusNode() =>
      _phoneFocusNode ?? (_phoneFocusNode = FocusNode());

  void changeSelectedUserState(int id, UsersTypeCubit cubit, UsersBloc bloc) {
    _selectedUsersState = id;
    cubit.changeUserState();
    bloc.add(GetUserEvent());
  }

  void activeDeActiveEmployee(
    BuildContext context,
    bool value,
    ViewUserBloc bloc,
    ActiveUserCubit cubit,
    int id,
  ) {
    ShowNoticeWidget.showNotice(
      context,
      value ? Text('Active User') : Text('Un Active User'),
      BlocProvider.value(
        value: bloc,
        child: BlocBuilder<ViewUserBloc, ViewUserState>(
          builder:
              (context, state) =>
                  state is LoadingActivateUserState ||
                          state is LoadingUnActivateUserState
                      ? SizedBox(height: 100, child: LoadingWidget())
                      : Text('Are you sure?'),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          NoticeOkButtonWidget(
            title: 'OK',
            function: () {
              value
                  ? bloc.add(ActivateUserEvent(id: id))
                  : bloc.add(UnActivateUserEvent(id: id));
              setIsActive(value, cubit);
            },
          ),
          NoticeCancleButtonWidget(),
        ],
      ),
      Icon(Icons.autorenew),
    );
  }

  bool getListUserState(UsersState state) =>
      tempList.isEmpty && state is SuccessGetUserState;

  void setIsActive(bool value, ActiveUserCubit cubit) {
    _isActive = value;
    cubit.changeActive();
  }

  void showFailedMessage(BuildContext context, UsersState state) {
    if (state is FailedGetUserState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showAddUserFailedMessage(BuildContext context, AddUserState state) {
    if (state is FailedAddUserState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is SuccessAddUserState) {
      context.read<ChangePageBloc>().add(MoveToUsersPageEvent(title: 'Users'));
    }
  }

  void showViewUserInfoFailedMessage(
    BuildContext context,
    ViewUserState state,
  ) {
    if (state is FailedGetUserInformationState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedActivateUserState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    } else if (state is FailedUnActivateUserState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  String? getPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please insert password';
    } else if (value.length <= 5) {
      return 'please insert more than 5 characters';
    }
    return null;
  }

  String? getConfirmPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please insert password';
    } else if (value.length <= 5) {
      return 'please insert more than 5 characters';
    } else if (_password != value) {
      return 'diffirent password';
    }
    return null;
  }

  String? getNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length <= 2) {
      return 'should be more than 2 characters';
    } else {
      return null;
    }
  }

  String? getEmailVaidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? getNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    final mobileRegex = RegExp(r'^\d{10}$');
    if (!mobileRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  Either<Widget, Widget> getCorrectWidget(UsersState state, Size size) {
    if (state is LoadingGetUserState) {
      return right(ListSearchShimmer(size: size));
    } else if (state is SuccessGetUserState && tempList.isEmpty) {
      return right(SvgPicture.asset(Assets.images.empty));
    } else if (state is FailedGetUserState) {
      return right(
        SizedBox(
          width: size.width,
          child: SvgPicture.asset(Assets.images.error, fit: BoxFit.contain),
        ),
      );
    } else {
      return left(const SizedBox());
    }
  }
}
