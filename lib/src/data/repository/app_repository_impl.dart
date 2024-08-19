import "dart:developer";

import "package:food_delivery/src/core/server/api/api.dart";
import "package:food_delivery/src/core/server/api/api_constants.dart";
import "package:food_delivery/src/data/entity/check_otp_model.dart";
import "package:food_delivery/src/data/entity/login_user_body_model.dart";
import "package:food_delivery/src/data/entity/login_user_model.dart";
import "package:food_delivery/src/data/entity/register_user_model.dart";
import "package:food_delivery/src/data/entity/reset_password_model.dart"
    show ResetPasswordModel;
import "package:food_delivery/src/data/repository/app_repository.dart";

class AppRepositoryImpl implements AppRepository {
  factory AppRepositoryImpl() => _impl;

  const AppRepositoryImpl._internal();

  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();

  @override
  Future<LoginUserModel?> loginUser(UserBodyModel user) async {
    try {
      final result = await ApiService.post(
        ApiConst.apiLogin,
        user.toJson(),
      );
      final model = loginUserModelFromJson(result!);
      return model;
    } on Exception catch (e) {
      log("problem from login user: $e \n\n\n\n\n\n");
    }
    return null;
  }

  @override
  Future<RegisterUserModel?> registerUser() async {
    try {
      final result = await ApiService.post(
        ApiConst.apiRegister,
        ApiParams.emptyParams(),
      );
      final model = registerUserModelFromJson(result!);
      return model;
    } on Exception catch (e) {
      log("problem from register user: $e \n\n\n\n\n\n");
    }
    return null;
  }

  @override
  Future<CheckOtpModel?> checkEmail() async {
    try {
      final result = await ApiService.post(
        ApiConst.apiCheckEmail,
        ApiParams.emptyParams(),
      );
      final model = checkOtpModelFromJson(result!);
      return model;
    } on Exception catch (e) {
      log("problem from check otp: $e \n\n\n\n\n\n");
    }
    return null;
  }

  @override
  Future<bool> forgotPassword(String email) async {
    try {
      final result = await ApiService.put(
        ApiConst.apiForgetPassword,
        ApiParams.forgetPasswordParam(email: email),
      );
      return result != null;
    } on Exception catch (e) {
      log("forget password problem: $e\n\n\n\n");
    }
    return false;
  }

  @override
  Future<bool> resetPassword(ResetPasswordModel model) async {
    try {
      final result = await ApiService.post(
        ApiConst.apiResetPassword,
        model.toJson(),
      );
      return result != null;
    } on Exception catch(e) {
      log("reset password problem: $e\n\n\n\n");
    }
    return false;
  }
}
