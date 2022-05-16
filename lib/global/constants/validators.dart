class Validator {
  Validator._();

  static bool validateEmpty(String value) {
    if (value.isEmpty) {
      return true;
    }
    return false;
  }

  static bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  static String? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  static bool validatePassword(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }

  static validateFirstName(String value) {
    if(value.isEmpty){
      return false;
    }
    return true;
  }

  static validateLastName(String value) {
    if(value.isEmpty){
      return false;
    }
    return true;
  }

  static validateContact(String value) {
    if(value.isEmpty){
      return false;
    }
    return true;
  }

  static validateName(String value) {
    if(value.isEmpty){
      return false;
    }
    return true;
  }
  static validateAirCraftName(String value) {
    if(value.isEmpty){
      return false;
    }
    return true;
  }

}
