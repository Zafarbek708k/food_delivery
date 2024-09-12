import "package:food_delivery/src/data/entity/cheak_email_model.dart";
import "package:food_delivery/src/data/entity/login_user_body_model.dart";
import "package:food_delivery/src/data/entity/login_user_model.dart";
import "package:food_delivery/src/data/entity/register_model.dart";
import "../entity/reset_password_model.dart";

abstract class AppRepository {
  ///auth: Abduazim
  Future<LoginUserModel?> loginUser(UserBodyModel body);

  Future<RegisterModel?> registerUser(RegisterModel user);

  Future<CheakEmailModel?> checkEmail(CheakEmailModel user);

  Future<bool> resetPassword(ResetPasswordModel model);

  Future<bool> forgotPassword(String email);
}
