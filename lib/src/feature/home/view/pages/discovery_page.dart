import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/feature/home/view/widgets/discover_delivery_card_widget.dart";
import "package:food_delivery/src/feature/home/view/widgets/discovery_banner_item_widget.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

import "../../../widgets/custom_appbar_widget.dart";

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  final PageController _bannerController = PageController();
  final List<String> _bannerImages = [
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
    "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: const AppBarWidget(
          appBarText: "Home, Ji ",
          bcgColor: Colors.white,
          textColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Banner section
                SizedBox(
                  height: 250.h,
                  child: Stack(
                    children: [
                      PageView.builder(
                        controller: _bannerController,
                        itemCount: _bannerImages.length,
                        itemBuilder: (context, index) => Padding(
                          padding: REdgeInsets.all(8),
                          child: DiscoveryBannerItemWidget(
                            imageUrl: _bannerImages[index],
                            bannerText: "Get your 30% daily \n discount now!",
                          ),
                        ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Fastest delivery 🔥",
                        style: context.theme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const RestaurantPageIn()));
                        },
                        child: const Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const RestaurantPageIn()));
                        },
                        padding: REdgeInsets.all(5),
                        child: const DeliveryCardWidget(
                          imageUrl:
                              "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                          title: "Crazy taco",
                          price: "€3.00",
                          time: "40-50min",
                          rating: "9.5",
                        ),
                      ),
                      CupertinoButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const RestaurantPageIn()));
                        },
                        padding: REdgeInsets.all(5),
                        child: const DeliveryCardWidget(
                          imageUrl:
                              "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                          title: "La Salsa",
                          price: "€2.00",
                          time: "30-40min",
                          rating: "8.5",
                        ),
                      ),
                      // Add more cards as needed
                    ],
                  ),
                ),

                // Popular items section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Popular items 👏",
                        style: context.theme.textTheme.bodyLarge
                            ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const RestaurantPageIn()));
                        },
                        child: const Text(
                          "See all",
                          style: TextStyle(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 250.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CupertinoButton(
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> const RestaurantPageIn()));
                        },
                        padding: REdgeInsets.all(5),
                        child: const DeliveryCardWidget(
                          imageUrl:
                              "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                          title: "La Salsa",
                          price: "€2.00",
                          time: "30-40min",
                          rating: "8.5",
                        ),
                      ),
                      const DeliveryCardWidget(
                        imageUrl:
                            "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
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
                ),
              ],
            ),
          ),
        ),
      );
}
