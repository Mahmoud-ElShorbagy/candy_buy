class Validators {
  static String? name(String? v) {
    if (v!.isEmpty) {
      return "Please enter your name";
    } else if (v.length < 2) {
      return "should be at least 2 characters";
    } else if (v.contains(" ")) {
      return "Space not allowed";
    }
    return null;
  }

  static String? email(String? v) {
    if (v!.isEmpty) {
      return "Please enter your email";
    } else if ((!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#//$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v))) {
      return "Please enter valid email";
    }
    return null;
  }

  static String? password(String? v) {
    if (v!.isEmpty) {
      return "Please enter your password";
    } else if (v.contains(" ")) {
      return "Space not allowed";
    } else if (v.length < 6) {
      return "Password must be at least 6 characters";
    }
    return null;
  }

  static String? phone(String? v) {
    if (v!.isEmpty) {
      return "Please enter your phone number";
    } else if (v.length < 11) {
      return "should be 11 digits";
    } else if (RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
            .hasMatch(v) ==
        false) {
      return "Please enter a valid phone number";
    }
    return null;
  }
}
