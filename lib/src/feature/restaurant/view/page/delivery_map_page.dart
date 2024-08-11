import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/riverpod.dart";
import "package:food_delivery/src/core/style/app_colors.dart";
import "package:food_delivery/src/feature/restaurant/view/widgets/delivery_bottom_widget.dart";
import "package:yandex_mapkit/yandex_mapkit.dart";

class MapDeliveryPage extends ConsumerStatefulWidget {
  const MapDeliveryPage({super.key});

  @override
  _MapDeliveryPageState createState() => _MapDeliveryPageState();
}

class _MapDeliveryPageState extends ConsumerState<MapDeliveryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(restaurantVm.notifier).determinePosition();
    });
  }

  @override
  Widget build(BuildContext context) {
    final restaurantVmState = ref.watch(restaurantVm);

    return Scaffold(
      body: restaurantVmState.isLoading
          ? Stack(
        children: [
          YandexMap(
            nightModeEnabled: false,
            mode2DEnabled: false,
            onMapCreated: (controller) {
              ref.read(restaurantVm.notifier).onMapCreated(controller);
            },
            mapObjects: restaurantVmState.mapObjectList,
          ),

          DeliveryBottomWidget(),

          Positioned(
            top: 50.h,
            left: 135.w,
            child: MaterialButton(
              onPressed: () {
                ref.read(restaurantVm.notifier).goLive();
              },
              minWidth: 100.w,
              height: 40.h,
              shape: const StadiumBorder(),
              color: AppColors.lF83B01,
              child: const Text(
                "Go Live",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
