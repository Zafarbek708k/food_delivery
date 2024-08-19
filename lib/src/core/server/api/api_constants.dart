final class ApiConst {
  const ApiConst._();

  static const Duration connectionTimeout = Duration(minutes: 1);
  static const Duration sendTimeout = Duration(minutes: 1);
  static const Duration receiveTimeout = Duration(minutes: 1);

  static const String baseUrl = "http://185.74.5.104:7090";
  static const String version = "/api/v1";

  // static const String sendSms = "$version/cabinet/sms/send";
  static const String apiLogin = "$version/auth/login";
  static const String apiRegister = "$version/auth/register";
  static const String apiCheckEmail = "$version/auth/check/email";

  /// restaurant
  static const String apiRestaurant = "$version/product/save";
}

final class ApiParams {
  const ApiParams._();

  static Map<String, dynamic> cabinetSmsCheckParams({required String phone, required String code}) =>
      <String, dynamic>{
        "phone": phone,
        "code": code,
      };

  static Map<String, dynamic> emptyParams() => <String, dynamic>{};
}
