import "package:flutter/widgets.dart";
import "package:food_delivery/src/core/storage/sheared_preferens.dart";
import "package:shared_preferences/shared_preferences.dart";

late final SharedPreferences db;
late final StorageService service;

Future<void> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await getStorageValues();
  db = await StorageService.init;
  service =
      StorageService(db: db);
}
