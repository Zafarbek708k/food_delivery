import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:food_delivery/setup.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:go_router/go_router.dart";

class AuthVm extends ChangeNotifier {
  bool loginEye = true;
  bool registerEye = true;

  String? errorMessage;

  TextEditingController otp = TextEditingController();

  final fromKey = GlobalKey<FormState>();
  final loginFromKey = GlobalKey<FormState>();
  final ressetEmailFromKey = GlobalKey<FormState>();
  final ressetEmailPawwordFromKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();

  TextEditingController ressetEmailController = TextEditingController();
  TextEditingController ressetPasswordController = TextEditingController();

  AuthVm();

  void singInBUtton({required BuildContext context}) {
    if (fromKey.currentState!.validate()) {
      service
        ..store("Name", registerNameController.text)
        ..store("Email", registerEmailController.text)
        ..store("Password", registerPasswordController.text);

      context.go("${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verification}");
    } else {
      notifyListeners();
    }
  }

  void loginButton({required BuildContext context}) {
    if (loginFromKey.currentState!.validate()) {
      // service
      //   ..store("Name", registerNameController.text)
      //   ..store("Email", registerEmailController.text)
      //   ..store("Password", registerPasswordController.text);
      // print(service.read("Name"));
      // print(service.read("Email"));
      // print(service.read("Password"));
      context.go(AppRouteName.discoveryPage);
    } else {
      context.go(AppRouteName.discoveryPage);

      notifyListeners();
    }
  }

  void singInEyeFunction() {
    {
      registerEye = !registerEye;
      notifyListeners();
    }
  }

  void loginEyeFunction() {
    {
      loginEye = !loginEye;
      notifyListeners();
    }
  }

  void validateOtp({required String otp, required BuildContext context}) {
    const validOtp = ["3", "5", "6", "9"];

    // Check if the entered OTP matches the valid numbers
    var isValid = true;
    for (var i = 0; i < otp.length; i++) {
      if (otp[i] != validOtp[i]) {
        isValid = false;
        break;
      }
    }

    if (!isValid || otp.isEmpty) {
      errorMessage = "Invalid OTP";
      notifyListeners();
    } else {
      errorMessage = null;
      notifyListeners();
      context.go(AppRouteName.discoveryPage);
    }
  }

  void validateOtpResset({required String otp, required BuildContext context}) {
    const validOtp = ["3", "5", "6", "9"];

    // Check if the entered OTP matches the valid numbers
    var isValid = true;
    for (var i = 0; i < otp.length; i++) {
      if (otp[i] != validOtp[i]) {
        isValid = false;
        break;
      }
    }

    if (!isValid || otp.isEmpty) {
      errorMessage = "Invalid OTP";
      notifyListeners();
    } else {
      errorMessage = null;
      notifyListeners();
      context.go(
        "${AppRouteName.signIn}/${AppRouteName.reSetEmail}/${AppRouteName.reSetVerification}/${AppRouteName.reSetPassword}",
      );
    }
  }

  void otnNullFunction() {
    errorMessage = null;
  }

  void ressetEmailButtonFunction({required BuildContext context}) {
    if (ressetEmailFromKey.currentState!.validate()) {
      service.store("RessetEmail", ressetEmailController.text);

      context.go("${AppRouteName.signIn}/${AppRouteName.reSetEmail}/${AppRouteName.reSetVerification}");
    } else {
      notifyListeners();
    }
  }

  void ressetPawwordButtonFunction({required BuildContext context}) {
    if (ressetEmailPawwordFromKey.currentState!.validate()) {
      service.store("RessetPassword", ressetPasswordController.text);

      context.go(AppRouteName.signIn);
    } else {
      notifyListeners();
    }
  }
}
