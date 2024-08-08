import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import '../../../core/style/app_colors.dart';

class MapDeliveryPage extends StatefulWidget {
  const MapDeliveryPage({super.key});

  @override
  State<MapDeliveryPage> createState() => _MapDeliveryPageState();
}

class _MapDeliveryPageState extends State<MapDeliveryPage> {
  late Position myPosition;
  late YandexMapController yandexMapController;
  List<MapObject> mapObjectList = [];
  bool isLoading = false;

  void onMapCreated(YandexMapController controller) {
    yandexMapController = controller;
    yandexMapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(latitude: myPosition.latitude, longitude: myPosition.longitude),
          zoom: 13,
          tilt: 900,
          azimuth: 180,
        ),
      ),
    );


    makeRoute();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }

    myPosition = await Geolocator.getCurrentPosition();
    isLoading = true;
    setState(() {});
    return myPosition;
  }

  Future<void> makeRoute() async {
    var route = YandexDriving.requestRoutes(
      drivingOptions: const DrivingOptions(
        routesCount: 3,
        // avoidPoorConditions: true,
      ),
      points: [
        /// Yo'lni boshlanish nuqtasi
        RequestPoint(
            point: Point(
              latitude:  myPosition.latitude,
              longitude: myPosition.longitude,
            ),
            requestPointType: RequestPointType.wayPoint),

        /// Yo'lni tugash nuqtasi
        RequestPoint(point: Point(latitude: myPosition.latitude+0.0014, longitude: myPosition.longitude+0.0014), requestPointType: RequestPointType.wayPoint),
      ],
    );


    var result = await route.result;
    log(result.routes.toString());

    if(result.routes!.isNotEmpty){
      for (var element in result.routes ?? []) {
        mapObjectList.add(
          PolylineMapObject(
            mapId: MapObjectId("route_${124.toString()}"),
            polyline: Polyline(
              points: element.geometry,
            ),
            strokeColor: AppColors.lF83B01    ,
            strokeWidth: 4,
          ),
        );
        // mapObjectList.removeRange(1, mapObjectList.length-1);
      }
    }
    setState(() {});
  }
  void findMe() {
    yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: myPosition.latitude,
              longitude: myPosition.longitude,
            ),
            zoom: 18,
            tilt: 50,
            azimuth: 180,
          ),
        ),
        animation: const MapAnimation(type: MapAnimationType.smooth, duration: 2));

    yandexMapController.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(latitude: myPosition.latitude, longitude: myPosition.longitude),
            zoom: 19,
            tilt: 90,
            azimuth: 180,
          ),
        ),
        animation: const MapAnimation(type: MapAnimationType.smooth, duration: 4));
  }

  @override
  void initState() {
    _determinePosition().then((_){
      findMe();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading ? Stack(
        children: [
          YandexMap(
            nightModeEnabled: true,
            mode2DEnabled: true,
            onMapCreated: onMapCreated,
            mapObjects: mapObjectList,
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    CircularPercentIndicator(
                      radius: 100.0,
                      lineWidth: 10.0,
                      percent: 0.5,
                      center: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "17",
                            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "min",
                            style: TextStyle(fontSize: 20.0),
                          ),
                          Text(
                            "delivery time",
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ],
                      ),
                      progressColor: Colors.orange.shade900,
                      backgroundColor: Colors.orange[200]!,
                    ),

                    const SizedBox(height: 10,),

                    const Text(
                      "La Pasta House",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10,),

                    const Text(
                      "Your order is being processed",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                      ),
                    ),

                    const SizedBox(height: 30,),

                    MaterialButton(
                      onPressed: (){},
                      height: 45,
                      minWidth: 350,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.orange.shade900,
                      shape: const StadiumBorder(),
                      child: const Text(
                        "Hide Delivery Status",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ) : const Center(child: CircularProgressIndicator(),),
    );
  }
}
