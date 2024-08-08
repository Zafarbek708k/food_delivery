import "package:flutter/material.dart";
import "package:percent_indicator/circular_percent_indicator.dart";
import "package:yandex_mapkit/yandex_mapkit.dart";

class MapDeliveryPage extends StatelessWidget {
  const MapDeliveryPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Stack(
          children: [
            const YandexMap(),
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
                        radius: 100,
                        lineWidth: 10,
                        percent: 0.5,
                        center: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "17",
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "min",
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              "delivery time",
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                        progressColor: Colors.orange.shade900,
                        backgroundColor: Colors.orange[200]!,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "La Pasta House",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Your order is being processed",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MaterialButton(
                        onPressed: () {},
                        height: 45,
                        minWidth: 350,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        color: Colors.orange.shade900,
                        shape: const StadiumBorder(),
                        child: const Text(
                          "Hide Delivery Status",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
