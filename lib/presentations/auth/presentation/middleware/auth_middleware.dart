import 'package:flutter/widgets.dart';

class AuthMiddleware {
  AuthMiddleware? _authMiddleware;
  AuthMiddleware getAuthMiddleware() =>
      _authMiddleware ?? (_authMiddleware = AuthMiddleware());
  FocusNode? _passwordFocusNode;
  FocusNode? _confirmNewPasswordFocusNode;
  FocusNode getPasswordFocuNode() =>
      _passwordFocusNode ?? (_passwordFocusNode = FocusNode());
  FocusNode getConfirmPasswordFocusNode() =>
      _confirmNewPasswordFocusNode ??
      (_confirmNewPasswordFocusNode = FocusNode());
}
