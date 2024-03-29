class Validation {
  String? validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      return 'Email cannot be empty';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Enter valid Email';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(String value) {
    // Password should have at least 6 characters
    if (value.length < 6) {
      return 'Password must contain at least 6 characters';
    }

    // Password should have at least one uppercase letter
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Password should have at least one lowercase letter
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Password should have at least one special character
    if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
      return 'Password must contain at least one special character';
    }

    // Password should have at least one digit
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Password is valid
    return null;
  }
}

String? validateEmail(String value) {
  RegExp regex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
  if (value.isEmpty) {
    return 'Email cannot be empty';
  } else {
    if (!regex.hasMatch(value)) {
      return 'Enter valid Email';
    } else {
      return null;
    }
  }
}

String? validateFullName(value) {
  if (value.isEmpty) {
    return "Enter your full name";
  }

  return null;
}

String? validatePhoneNumber(String value) {
  if (value.isEmpty) {
    return "Enter your phone number";
  }
  if (value.length != 11) {
    //excluding 0
    return "Invalid Phone Number";
  }
  return null;
}

String? validateLoginPassword(value) {
  if (value.isEmpty) {
    return 'invalid password';
  }
  if (value.length < 6) {
    return 'Password must contain at least 6 characters';
  }
  return null;
}

String? validateConfirmPassword(value, confirmPassword) {
  if (value != confirmPassword) {
    return "Passwords do not match";
  }
  if (value.isEmpty) {
    return 'Password cannot be empty';
  }
  return null;
}

String? validatePassword(String value) {
  // Password should have at least 6 characters
  if (value.length < 6) {
    return 'Password must contain at least 6 characters';
  }

  // Password should have at least one uppercase letter
  if (!value.contains(RegExp(r'[A-Z]'))) {
    return 'Password must contain at least one uppercase letter';
  }

  // Password should have at least one lowercase letter
  if (!value.contains(RegExp(r'[a-z]'))) {
    return 'Password must contain at least one lowercase letter';
  }

  // Password should have at least one special character
  if (!value.contains(RegExp(r'[!@#\$&*~]'))) {
    return 'Password must contain at least one special character';
  }

  // Password should have at least one digit
  if (!value.contains(RegExp(r'[0-9]'))) {
    return 'Password must contain at least one digit';
  }

  // Password is valid
  return null;
}
