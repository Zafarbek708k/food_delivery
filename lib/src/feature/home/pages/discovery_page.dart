import 'package:flutter/material.dart';
import 'package:food_delivery/src/feature/widgets/custom_appbar_widget.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/discover_delivery_card_widget.dart';
import '../widgets/discovery_banner_item_widget.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final PageController _bannerController = PageController();
  final List<String> _bannerImages = [
    'https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg',
    'https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg',
    'https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: const AppBarWidget(appBarText: "Home, Ji ",bcgColor: Colors.white,textColor: Colors.black,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner section
              SizedBox(
                height: 250.0,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: _bannerController,
                      itemCount: _bannerImages.length,
                      itemBuilder: (context, index) => DiscoveryBannerItemWidget(imageUrl: _bannerImages[index], bannerText: "Get your 30% daily \n discount now!"),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: SmoothPageIndicator(
                          controller: _bannerController,
                          count: _bannerImages.length,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 8,
                            dotWidth: 8,
                            activeDotColor: Colors.black,
                            dotColor: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Fastest delivery section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Fastest delivery 🔥",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See all"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DeliveryCardWidget(
                      imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                      title: "Crazy taco",
                      price: "€3.00",
                      time: "40-50min",
                      rating: "9.5",
                    ),
                    DeliveryCardWidget(
                      imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                      title: "La Salsa",
                      price: "€2.00",
                      time: "30-40min",
                      rating: "8.5",
                    ),
                    // Add more cards as needed
                  ],
                ),
              ),

              // Popular items section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Popular items 👏",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("See all"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 250.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    DeliveryCardWidget(
                      imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                      title: "Spagetti",
                      price: "€5.00",
                      time: "20-30 min",
                      rating: "8.5",
                    ),
                    DeliveryCardWidget(
                      imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                      title: "Burger",
                      price: "€2.00",
                      time: "25-35",
                      rating: "8.8",
                    ),
                  ],
                ),
              ),

              const SizedBox(
                height: 75,
              )
            ],
          ),
        ),
      )
    );
}




