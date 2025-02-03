import 'app_regex.dart';

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  } else if (value.length < 2) {
    return 'Name must be at least 2 characters';
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  } else if (!AppRegex.isEmailValid(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  } else if (!AppRegex.isPasswordValid(value)) {
    return 'Password must contain at least 8 characters, '
        'including\n an uppercase letter, number, and special character';
  }
  return null;
}

String? validateConfirmPassword(String? value, String password) {
  if (value == null || value.isEmpty) {
    return 'Confirm your password';
  } else if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? validateAddress(String? value) {
  if (value == null || value.isEmpty) {
    return 'Address is required';
  } else if (value.length < 5) {
    return 'Address must be at least 5 characters';
  } else if (!AppRegex.isAddressValid(value)) {
    return 'Enter a valid address (letters, numbers, spaces, and basic punctuation)';
  }
  return null;
}

String? validateCommercialRegistration(String? value) {
  if (value == null || value.isEmpty) {
    return 'Commercial registration number is required';
  } else if (!AppRegex.isCommercialRegistrationValid(value)) {
    return 'Enter a valid commercial registration number (8-12 digits)';
  }
  return null;
}

String? validateTaxId(String? value) {
  if (value == null || value.isEmpty) {
    return 'Tax ID is required';
  } else if (!AppRegex.isTaxIdValid(value)) {
    return 'Tax ID must be exactly 12 numeric characters';
  }
  return null;
}