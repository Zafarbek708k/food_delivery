import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:food_delivery/setup.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/storage/app_storage.dart";
import "package:go_router/go_router.dart";

class AuthVm extends ChangeNotifier {
  bool loginEye = true;
  bool registerEye = true;

  String? errorMessage;

  TextEditingController otp = TextEditingController();

  final fromKey = GlobalKey<FormState>();
  final loginFromKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();

  AuthVm();

  void singInBUtton({required BuildContext context}) {
    if (fromKey.currentState!.validate()) {
      service
        ..store("Name", registerNameController.text)
        ..store("Email", registerEmailController.text)
        ..store("Password", registerPasswordController.text);
      print(service.read("Name"));
      print(service.read("Email"));
      print(service.read("Password"));

      context.go("${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verification}");
    } else {
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
    const validOtp = ['3', '5', '6', '9'];

    // Check if the entered OTP matches the valid numbers
    bool isValid = true;
    for (int i = 0; i < otp.length; i++) {
      if (otp[i] != validOtp[i]) {
        isValid = false;
        break;
      }
    }

    if (!isValid) {
      errorMessage = "Invalid OTP";
      notifyListeners();
    } else {
      errorMessage = null;
      notifyListeners();
      context.go(AppRouteName.discoveryPage);
    }
  }

  void otnNullFunction() {
    errorMessage = null;
  }
}
