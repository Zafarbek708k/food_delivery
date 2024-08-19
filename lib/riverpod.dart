import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:food_delivery/src/feature/auth/vm/auth_vm.dart";
import "package:food_delivery/src/feature/restaurant/view_model/map_vm.dart";

final mapVM = ChangeNotifierProvider<MapVm>(
    (ref) => MapVm(),
);

final authVm = ChangeNotifierProvider<AuthVm>(
    (ref) => AuthVm(),
);
