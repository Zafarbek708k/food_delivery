import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:food_delivery/src/feature/restaurant/view_model/restaurant_vm.dart";

final restaurantVm = ChangeNotifierProvider<RestaurantVm>(
    (ref) => RestaurantVm(),
);