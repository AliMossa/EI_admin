class Validations {
  static String? getEmailVaidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? getNameValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length <= 2) {
      return 'should be more than 2 characters';
    } else {
      return null;
    }
  }

  static String? getNumberValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your mobile number';
    }
    final mobileRegex = RegExp(r'^\d{10}$');
    if (!mobileRegex.hasMatch(value)) {
      return 'Enter a valid 10-digit mobile number';
    }
    return null;
  }

  static String? getAmountValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter amount';
    }
    final mobileRegex = RegExp(r'\d+');
    if (!mobileRegex.hasMatch(value)) {
      return 'Enter a valid Amount';
    }
    return null;
  }

  static String? getPasswordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'please insert password';
    } else if (value.length <= 5) {
      return 'please insert more than 5 characters';
    }
    return null;
  }

  static String? getnotesValidation(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    } else if (value.length <= 5) {
      return 'should be more than 5 characters';
    } else {
      return null;
    }
  }
}
