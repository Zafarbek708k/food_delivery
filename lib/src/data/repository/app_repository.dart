import "package:food_delivery/src/data/entity/check_otp_model.dart";
import "package:food_delivery/src/data/entity/login_user_body_model.dart";
import "package:food_delivery/src/data/entity/login_user_model.dart";
import "package:food_delivery/src/data/entity/register_model.dart";
import "../entity/reset_password_model.dart";

abstract class AppRepository {
  ///auth: Abduazim
  Future<LoginUserModel?> loginUser(UserBodyModel body);

  Future<RegisterModel?> registerUser(RegisterModel user);

  Future<CheckOtpModel?> checkEmail();

  Future<bool> resetPassword(ResetPasswordModel model);

  Future<bool> forgotPassword(String email);
}
