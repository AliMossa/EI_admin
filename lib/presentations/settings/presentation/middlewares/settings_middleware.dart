import 'package:admin_dashboard/presentations/public/error_widget/snack_bar_widget.dart';
import 'package:admin_dashboard/presentations/settings/domain/entities/change_password_entity.dart';
import 'package:admin_dashboard/presentations/settings/presentation/logic/bloc/password_bloc.dart';
import 'package:admin_dashboard/util/safe_storage/safe_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsMiddleware {
  SettingsMiddleware? _settingsMiddleware;
  SettingsMiddleware get() =>
      _settingsMiddleware ?? (_settingsMiddleware = SettingsMiddleware());
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _password;
  String? _confirmPassword;
  FocusNode _confirmPasswordFocusNode = FocusNode();

  void setPassword(String password) => _password = password;
  void setConfirmPassword(String confirmPassword) =>
      _confirmPassword = confirmPassword;

  FocusNode getConfirmPasswordFocusNode() => _confirmPasswordFocusNode;
  GlobalKey getKey() => _formKey;
  Future<ChangePasswordEntity> getChangePasswordData() async {
    final email = await SafeStorage.read('email');
    return ChangePasswordEntity(
      email: email!,
      password: _password!,
      confirmPassword: _confirmPassword!,
    );
  }

  void returnChangePasswordState(BuildContext context, PasswordState state) {
    if (state is FailedChangePasswordState) {
      SnackBarWidget().show(context, state.message, Colors.red);
    }
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

  void changePassword(PasswordBloc bloc) {
    if (_formKey.currentState!.validate()) {
      bloc.add(ChangePasswordEvent());
    }
  }
}
