import "dart:developer";

import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:food_delivery/setup.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/core/storage/app_storage.dart";
import "package:food_delivery/src/data/entity/login_user_body_model.dart";
import "package:food_delivery/src/data/entity/register_model.dart";
import "package:food_delivery/src/data/repository/app_repository_impl.dart";
import "package:go_router/go_router.dart";

class AuthVm extends ChangeNotifier {
  bool loginEye = true;
  bool registerEye = true;
  bool isLoading = false;

  String? errorMessage;

  TextEditingController otp = TextEditingController();

  final fromKey = GlobalKey<FormState>();
  final loginFromKey = GlobalKey<FormState>();
  final resetEmailFromKey = GlobalKey<FormState>();
  final resetEmailPasswordFromKey = GlobalKey<FormState>();

  TextEditingController loginEmailController = TextEditingController(text: "thebestxurshidjon@gmail.com");
  TextEditingController loginPasswordController = TextEditingController(text: "string1234");

  TextEditingController registerEmailController = TextEditingController(text: "thebestxurshidjon@gmail.com");
  TextEditingController registerPasswordController = TextEditingController(text: "string1234");
  TextEditingController registerNameController = TextEditingController(text: "Xurshidjon");

  TextEditingController resetEmailController = TextEditingController();
  TextEditingController resetPasswordController = TextEditingController();

  void singUpButton({required BuildContext context}) {
    if (fromKey.currentState!.validate()) {
      service
        ..store("Name", registerNameController.text)
        ..store("Email", registerEmailController.text)
        ..store("Password", registerPasswordController.text);

      // context.go(
      //   "${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verification}",
      // );
    } else {
      notifyListeners();
    }
  }

  Future<bool> registerButton({required BuildContext context}) async {
    if (fromKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final user = RegisterModel(
        email: registerEmailController.text.trim(),
        password: registerPasswordController.text.trim(),
      );
      final res = await AppRepositoryImpl().registerUser(user);
      if (res != null) {
        log("sdcsdsdsdcsdcs");
        context.go(
          "${AppRouteName.signIn}/${AppRouteName.signUp}/${AppRouteName.verification}",
        );
        return true;
      }
      log(res.toString());
      isLoading = false;
      notifyListeners();
    }
    return false;
  }

  Future<bool> loginButton() async {
    if (loginFromKey.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final user = UserBodyModel(
        email: loginEmailController.text.trim(),
        password: loginPasswordController.text.trim(),
      );
      final res = await AppRepositoryImpl().loginUser(user);
      log(res.toString());
      log("${res?.token}");
      if (res?.token != null) {
        await AppStorage.$write(
          key: StorageKey.token,
          value: res!.token!,
        );
        log(res.token.toString());
        isLoading = false;
        notifyListeners();
        return true;
      }
      isLoading = false;
      notifyListeners();
    } else {
      notifyListeners();
    }
    return false;
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

  void validateOtpReset({required String otp, required BuildContext context}) {
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

  void resetEmailButtonFunction({required BuildContext context}) {
    if (resetEmailFromKey.currentState!.validate()) {
      service.store("ResetEmail", resetEmailController.text);

      context.go(
        "${AppRouteName.signIn}/${AppRouteName.reSetEmail}/${AppRouteName.reSetVerification}",
      );
    } else {
      notifyListeners();
    }
  }

  void resetPasswordButtonFunction({required BuildContext context}) {
    if (resetEmailPasswordFromKey.currentState!.validate()) {
      service.store("ResetPassword", resetPasswordController.text);

      context.go(AppRouteName.signIn);
    } else {
      notifyListeners();
    }
  }
}
