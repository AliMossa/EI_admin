import 'package:admin_dashboard/presentations/auth/domain/entities/auth_entity.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/bloc/check_code_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/reset_password/reset_password_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/login/login_bloc.dart';
import 'package:admin_dashboard/presentations/auth/presentation/logic/set_email_check_code/set_email_bloc.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthMiddleware {
  String? _email;
  String? _password;
  String? _newPassword;
  String? _confirmNewPassword;
  String? _checkCode;
  static AuthMiddleware? _authMiddleware;
  final GlobalKey<FormState> _loginGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _sendVerificationCodeGlobalKey =
      GlobalKey<FormState>();

  final GlobalKey<FormState> _checkCodeGlobalKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _resetPasswordGlobalKey = GlobalKey<FormState>();
  static AuthMiddleware get() =>
      _authMiddleware ?? (_authMiddleware = AuthMiddleware());
  GlobalKey<FormState> getLoginGlobalKey() => _loginGlobalKey;
  GlobalKey<FormState> getSendVerificationCodeGlobalKey() =>
      _sendVerificationCodeGlobalKey;
  GlobalKey<FormState> getCheckCodeGlobalKey() => _checkCodeGlobalKey;
  GlobalKey<FormState> getResetpasswordGlobalKey() => _resetPasswordGlobalKey;

  void setEmail(String newValue) => _email = newValue;
  void setPassword(String newValue) => _password = newValue;
  void setNewPassword(String newValue) => _newPassword = newValue;
  void setConfirmNewPassword(String newValue) => _confirmNewPassword = newValue;

  void setCheckCode(String newValue) => _checkCode = newValue;

  String getEmail() => _email!;
  String getCheckCode() => _checkCode!;
  String getNewPassword() => _newPassword!;
  String getConfrimNewPassword() => _confirmNewPassword!;

  AuthEntity getLoginInfo() => AuthEntity(email: _email!, password: _password!);
  void loginButtonFunction(BuildContext context, LoginBloc bloc) {
    if (getLoginGlobalKey().currentState!.validate()) {
      bloc.add(SendLoginEvent());
    } else {
      SnackBarWidget().show(
        context,
        'can\'t login with this information',
        Colors.red,
      );
    }
  }

  void checkCodeButtonFunction(BuildContext context, CheckCodeBloc bloc) {
    if (getCheckCodeGlobalKey().currentState!.validate()) {
      bloc.add(VerifyCodeEvent());
    } else {
      SnackBarWidget().show(
        context,
        'can\'t check code with this information',
        Colors.red,
      );
    }
  }

  void sendVerificationCodeButtonFunction(
    BuildContext context,
    SetEmailBloc bloc,
  ) {
    if (getSendVerificationCodeGlobalKey().currentState!.validate()) {
      bloc.add(SendVerificationCodeEvent());
    } else {
      SnackBarWidget().show(
        context,
        'can\'t send verification code with this information',
        Colors.red,
      );
    }
  }

  void resetPasswordButtonFunction(
    BuildContext context,
    ResetPasswordBloc bloc,
  ) {
    if (getResetpasswordGlobalKey().currentState!.validate()) {
      bloc.add(ResetForgottenPasswordEvent());
    } else {
      SnackBarWidget().show(
        context,
        'can\'t reset password with this information',
        Colors.red,
      );
    }
  }

  Future<bool> isLogged() async {
    final response = await SafeStorage.read('token');
    if (response != null) {
      return true;
    }
    return false;
  }

  Future<void> saveToken(String token) async =>
      await SafeStorage.write('token', token);

  FocusNode? _passwordFocusNode;
  FocusNode? _confirmNewPasswordFocusNode;
  FocusNode getPasswordFocuNode() =>
      _passwordFocusNode ?? (_passwordFocusNode = FocusNode());
  FocusNode getConfirmPasswordFocusNode() =>
      _confirmNewPasswordFocusNode ??
      (_confirmNewPasswordFocusNode = FocusNode());

  void showLoginFailedMessage(BuildContext context, LoginState state) {
    if (state is FailedSendLoginState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showResetPasswordFailedMessage(
    BuildContext context,
    ResetPasswordState state,
  ) {
    if (state is FailedResetForgottenPasswordState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showSendCheckEmailFailedMessage(
    BuildContext context,
    SetEmailState state,
  ) {
    if (state is FailedSendVerificationCodeState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showVerifyCodeFailedMessage(BuildContext context, CheckCodeState state) {
    if (state is FailedVerifyCodeState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showCurrentStateInLogin(BuildContext context, LoginState state) {
    if (state is SuccessSendLoginState) {
      SnackBarWidget().show(context, state.message, Colors.green);
      context.go('/home');
    } else if (state is FailedSendLoginState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
    if (state is SuccessCheckLoggingState) {
      SnackBarWidget().show(context, 'welcom again :)', Colors.green);
      context.go('/home');
    }
  }

  void showCurrentStateInResetPassword(
    BuildContext context,
    ResetPasswordState state,
  ) {
    if (state is SuccessResetForgottenPasswordState) {
      context.read<AuthBloc>().add(MoveToLoginPageEvent());
    }
    if (state is FailedResetForgottenPasswordState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showCurrentStateInCheckCode(BuildContext context, CheckCodeState state) {
    if (state is SuccessVerifyCodeState) {
      context.read<AuthBloc>().add(MoveToResetPasswordPageEvent());
    }
    if (state is FailedVerifyCodeState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }

  void showCurrentStateInSetEmailCheckCode(
    BuildContext context,
    SetEmailState state,
  ) {
    if (state is SuccessSendVerificationCodeState) {
      context.read<AuthBloc>().add(MoveToCheckCodePageEvent());
    }
    if (state is FailedSendVerificationCodeState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
  }
}
