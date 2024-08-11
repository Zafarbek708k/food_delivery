import "dart:developer";

import "package:food_delivery/src/core/server/api/api.dart";
import "package:food_delivery/src/core/server/api/api_constants.dart";
import "package:food_delivery/src/data/entity/check_otp_model.dart";
import "package:food_delivery/src/data/entity/login_user_model.dart";
import "package:food_delivery/src/data/entity/register_user_model.dart";
import "package:food_delivery/src/data/repository/app_repository.dart";

class AppRepositoryImpl implements AppRepository {
  factory AppRepositoryImpl() => _impl;

  const AppRepositoryImpl._internal();

  static const AppRepositoryImpl _impl = AppRepositoryImpl._internal();

  @override
  Future<LoginUserModel?> loginUser() async {
    try {
      final result = await ApiService.post(
        ApiConst.apiLogin,
        ApiParams.emptyParams(),
      );
      final model = loginUserModelFromJson(result!);
      return model;
    } catch (e) {
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
    } catch (e) {
      log("problem from register user: $e \n\n\n\n\n\n");
    }
    return null;
  }

  @override
  Future<CheckOtpModel?> checkOTP() async {
    try {
      final result = await ApiService.post(
        ApiConst.apiCheckEmail,
        ApiParams.emptyParams(),
      );
      final model = checkOtpModelFromJson(result!);
      return model;
    } catch (e) {
      log("problem from check otp: $e \n\n\n\n\n\n");
    }
  }
}
