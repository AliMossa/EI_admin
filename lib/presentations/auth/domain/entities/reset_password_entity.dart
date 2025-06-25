class ResetPasswordEntity {
  String email;
  String newPassword;
  String confirmNewPassword;
  ResetPasswordEntity({
    required this.email,
    required this.newPassword,
    required this.confirmNewPassword,
  });
}
