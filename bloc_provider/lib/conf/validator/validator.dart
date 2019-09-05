// Basic regular expressions for validating strings
final emailPattern 	               = r'^[a-zA-Z0-9](([.]{1}|[_]{1})?[a-zA-Z0-9])*[@]([a-z0-9]+([.]{1}|-)?)*[a-zA-Z0-9]+[.]{1}[a-z]{2,253}$';

final invalidEmailMessage          = 'Invalid Email';
final invalidPasswordMessage       = 'Invalid Password';
final invalidPasswordFormatMessage = 'Password requires minimum 6 characters';

bool isMatchedPattern(String pattern, dynamic input) {
  if (!RegExp(pattern).hasMatch(input)) {
    return false;
  }

  return true;
}

class Result {
  bool isTrue;
  String message;
}

class Validator {
  static bool isEmail(String email) {
    return isMatchedPattern(emailPattern, email);
  }

  static bool isPassword(String password) {
    if (password == null || password.length < 6) {
      return false;
    }
    
    return true;
  }
}