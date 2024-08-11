import "package:food_delivery/src/data/entity/check_otp_model.dart";
import "package:food_delivery/src/data/entity/login_user_model.dart";
import "package:food_delivery/src/data/entity/register_user_model.dart";

abstract class AppRepository {
  Future<LoginUserModel?> loginUser();

  Future<RegisterUserModel?> registerUser();

  Future<CheckOtpModel?> checkOTP();
}
