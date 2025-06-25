import 'package:admin_dashboard/presentations/auth/presentation/logic/cubit/login_pages_cubit.dart';
import 'package:admin_dashboard/presentations/auth/presentation/login_page.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code/check_code_items_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/check_code/check_code_page.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/login_items_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/reset_password_list_items_widget.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/reset_password/reset_password_page.dart';
import 'package:admin_dashboard/presentations/auth/presentation/widgets/set_email_check_code.dart/set_email_check_code_page.dart';
import 'package:admin_dashboard/presentations/public/auth/logic/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';

class AuthWidgetMiddleware {
  Widget getCorrectAuthPage(AuthState state, Size size) {
    switch (state) {
      case AuthInitial():
      case MoveToLoginPageState():
        return LoginPage();
      case MoveToCheckCodePageState():
        return CheckCodePage();
      case MoveToSetEmailCheckCodePageState():
        return SetEmailCheckCodePage();
      case MoveToResetPasswordPageState():
        return ResetPasswordPage();
    }
  }
}
