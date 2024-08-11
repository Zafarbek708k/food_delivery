import "dart:async";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:geolocator/geolocator.dart";
import "package:yandex_mapkit/yandex_mapkit.dart";

import "../../../core/style/app_colors.dart";

final deliveryTimeProvider = StateNotifierProvider<DeliveryTimeNotifier, DeliveryTimeState>(
      (ref) => DeliveryTimeNotifier(),
);

class RestaurantVm extends ChangeNotifier {
  late Position myPosition;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjectList = [];
  bool isLoading = false;
  String time = "0";

  Future<void> goLive() async {
    Geolocator.getPositionStream(
      locationSettings: const LocationSettings(),
    ).listen((event) async {

      unawaited(yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(latitude: event.latitude, longitude: event.longitude),
            zoom: 20,
          ),
        ),
        animation: const MapAnimation(type: MapAnimationType.smooth),
      ),);

      log("Latitude: ${event.latitude}");
      log("Longitude: ${event.longitude}");
      log("Speed: ${event.speed}");

      final route = YandexDriving.requestRoutes(
        drivingOptions: const DrivingOptions(
          routesCount: 3,
        ),
        points: [
          RequestPoint(
            point: Point(latitude: event.latitude, longitude: event.longitude),
            requestPointType: RequestPointType.wayPoint,
          ),
          RequestPoint(
            point: Point(
              latitude: event.latitude + 0.0094,
              longitude: event.longitude + 0.0054,
            ),
            requestPointType: RequestPointType.wayPoint,
          ),
        ],
      );

      final result = await route.result;

      if (result.routes != null && result.routes!.isNotEmpty) {
        mapObjectList.clear();

        for (final element in result.routes!) {
          final duration = element.metadata.weight.timeWithTraffic;
          time = duration.text;
        }
        notifyListeners();
      }
    });
  }


  void onMapCreated(YandexMapController controller) {
    yandexMapController = controller;
    yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(latitude: myPosition.latitude, longitude: myPosition.longitude),
          zoom: 15,
        ),
      ),
    );
    notifyListeners();

    makeRoute();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error("Location services are disabled.");
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permissions are denied.");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error("Location permissions are permanently denied.");
    }

    myPosition = await Geolocator.getCurrentPosition();
    isLoading = true;
    notifyListeners();
    return myPosition;
  }

  Future<void> makeRoute() async {
    final route = YandexDriving.requestRoutes(
      drivingOptions: const DrivingOptions(
        routesCount: 3,
      ),
      points: [
        RequestPoint(
          point: Point(
            latitude: myPosition.latitude,
            longitude: myPosition.longitude,
          ),
          requestPointType: RequestPointType.wayPoint,
        ),
        RequestPoint(
          point: Point(
            latitude: myPosition.latitude + 0.0094,
            longitude: myPosition.longitude + 0.0054,
          ),
          requestPointType: RequestPointType.wayPoint,
        ),
      ],
    );

    final result = await route.result;
    log(result.routes.toString());

    if (result.routes != null && result.routes!.isNotEmpty) {
      mapObjectList.clear();

      for (final element in result.routes!) {
        // Add the route to the map
        mapObjectList.add(
          PolylineMapObject(
            mapId: const MapObjectId("route_${124}"),
            polyline: Polyline(
              points: element.geometry,
            ),
            strokeColor: AppColors.lF83B01,
            strokeWidth: 10,
          ),
        );

        // Calculate and log the estimated delivery time
        final duration = element.metadata.weight.timeWithTraffic;
        time = duration.text;
        log("Estimated delivery time: $time minutes");
      }
      notifyListeners();
    }
  }

}




class DeliveryTimeState {
  final int totalDeliveryTime;
  final int elapsedTime;

  DeliveryTimeState({
    required this.totalDeliveryTime,
    required this.elapsedTime,
  });

  double get percentCompleted => (elapsedTime / totalDeliveryTime).clamp(0.0, 1.0);
}

class DeliveryTimeNotifier extends StateNotifier<DeliveryTimeState> {
  DeliveryTimeNotifier() : super(DeliveryTimeState(totalDeliveryTime: 3600, elapsedTime: 0));

  void updateElapsedTime(int newElapsedTime) {
    state = DeliveryTimeState(
      totalDeliveryTime: state.totalDeliveryTime,
      elapsedTime: newElapsedTime,
    );
  }

  void setTotalDeliveryTime(int newTotalDeliveryTime) {
    state = DeliveryTimeState(
      totalDeliveryTime: newTotalDeliveryTime,
      elapsedTime: state.elapsedTime,
    );
  }
}

