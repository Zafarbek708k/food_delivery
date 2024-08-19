import "dart:developer";

import "package:flutter/widgets.dart";
import "package:food_delivery/src/core/storage/app_storage.dart";
import "package:food_delivery/src/core/storage/sheared_preferens.dart";
import "package:shared_preferences/shared_preferences.dart";

late final SharedPreferences db;
late final StorageService service;
String? token;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await getStorageValues();
  AppStorage.clearAllData();
  db = await StorageService.init;
  token = await AppStorage.$read(key: StorageKey.token);
  log("token: $token\n\n\n");
  service = StorageService(db: db);
}
