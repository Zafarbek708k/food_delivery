import "dart:developer";
import "package:flutter/material.dart";
import "package:geolocator/geolocator.dart";
import "package:yandex_mapkit/yandex_mapkit.dart";

import "../../../core/style/app_colors.dart";

class RestaurantVm extends ChangeNotifier {
  late Position myPosition;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjectList = [];
  bool isLoading = false;

  Future<void> goLive()async{
    Geolocator.getPositionStream(
        locationSettings: const LocationSettings(
          // distanceFilter: 5,
          // timeLimit: Duration(seconds: 5)
        ),
    ).listen((event) {
      yandexMapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(latitude: event.latitude, longitude: event.longitude),
              zoom: 20,
            ),
          ),
          animation: const MapAnimation(type: MapAnimationType.smooth),);
      // putLabel(
      //     lan: event.latitude,
      //     lon: event.longitude,
      //     id: event.longitude.toString()
      // );
      // mapObjectList.removeRange(1, mapObjectList.length);
      notifyListeners();
      log(event.latitude.toString());
      log(event.longitude.toString());
      log(event.speed.toString());
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
          point: Point(latitude: myPosition.latitude + 0.0034, longitude: myPosition.longitude + 0.0034),
          requestPointType: RequestPointType.wayPoint,
        ),
      ],
    );

    final result = await route.result;
    log(result.routes.toString());

    if (result.routes != null && result.routes!.isNotEmpty) {
      mapObjectList.clear();

      for (final element in result.routes!) {
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

        // mapObjectList.add(
        //   PlacemarkMapObject(
        //     mapId: const MapObjectId("start_label"),
        //     point: element.geometry.first,
        //     icon: PlacemarkIcon.single(
        //       PlacemarkIconStyle(
        //         image: BitmapDescriptor., // Replace with your marker image
        //         scale: 0.5,
        //       ),
        //     ),
        //     opacity: 1.0,
        //     zIndex: 1,
        //   ),
        // );
        //
        // mapObjectList.add(
        //   PlacemarkMapObject(
        //     mapId: const MapObjectId("end_label"),
        //     point: element.geometry.last,
        //     icon: PlacemarkIcon.single(
        //       PlacemarkIconStyle(
        //         image: BitmapDescriptor.fromAsset('assets/end_marker.png'), // Replace with your marker image
        //         scale: 0.5,
        //       ),
        //     ),
        //     opacity: 1.0,
        //     zIndex: 1,
        //   ),
        // );
      }
      notifyListeners();
    }
  }

}
