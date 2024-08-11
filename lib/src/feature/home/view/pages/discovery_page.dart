import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/feature/home/view/widgets/discover_delivery_card_widget.dart";
import "package:food_delivery/src/feature/home/view/widgets/discovery_banner_item_widget.dart";
import "package:food_delivery/src/feature/home/view_model/my_home_page_vm.dart";
import "package:go_router/go_router.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../../widgets/custom_appbar_widget.dart";

class DiscoveryPage extends ConsumerStatefulWidget {
  const DiscoveryPage({super.key});

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends ConsumerState<DiscoveryPage> {
  @override
  Widget build(BuildContext context) {
    ref.watch(myHomePageVm);
    final controller = ref.read(myHomePageVm);
    return Scaffold(
      appBar: const AppBarWidget(
        appBarText: "Home, Ji ",
        bcgColor: Colors.white,
        textColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner section
            SizedBox(
              height: 250.h,
              child: Stack(
                children: [
                  PageView.builder(
                    controller: controller.bannerController,
                    itemCount: controller.bannerImages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: REdgeInsets.all(8),
                      child: DiscoveryBannerItemWidget(
                        imageUrl: controller.bannerImages[index],
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
                        controller: controller.bannerController,
                        count: controller.bannerImages.length,
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
                    style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange.withOpacity(0.3),
                    ),
                    onPressed: () {
                      controller.seeAll(context: context);
                    },
                    child: const Text(
                      "    See all    ",
                      style: TextStyle(
                        color: Colors.deepOrange,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 260.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  DeliveryCardWidget(
                    imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                    title: "Oq Tepa Lavash",
                    price: "€3.00",
                    time: "40-50min",
                    rating: "9.5",
                    onPressed: () {
                      context.go("${AppRouteName.discoveryPage}/${AppRouteName.restaurantDetailPage}");
                    },
                    description: "description",
                  ),
                  DeliveryCardWidget(
                    imageUrl:
                        "https://www.southernliving.com/thmb/iL2CEgCAMqC4cpp6taRqwYQI1gs=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/27162_FGFsuperbowl_0359_16x9-2000-5dd253dc23044ee78aacd9673f5befbc.jpg",
                    title: "Rayxon",
                    price: "€2.00",
                    time: "30-40min",
                    rating: "8.5",
                    onPressed: () {
                      context.go("${AppRouteName.discoveryPage}/${AppRouteName.restaurantDetailPage}");
                    },
                    description: "description",
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
                    style: context.theme.textTheme.bodyLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.orange.withOpacity(0.3),
                    ),
                    onPressed: () {
                      controller.seeAll(context: context);
                    },
                    child: const Text(
                      "    See all    ",
                      style: TextStyle(
                        color: Colors.deepOrange,
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
                  DeliveryCardWidget(
                    imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                    title: "Evos Lavash",
                    price: "€2.00",
                    time: "30-40min",
                    rating: "8.5",
                    onPressed: () {
                      context.go("${AppRouteName.discoveryPage}/${AppRouteName.restaurantDetailPage}");
                    },
                    description: "description",
                  ),
                  DeliveryCardWidget(
                    imageUrl: "https://insights.workwave.com/wp-content/uploads/2021/08/WorkWave-The-Carbon-Footprint-of-Food-Delivery-Services.jpg",
                    title: "Feed Up",
                    price: "€2.00",
                    time: "25-35",
                    rating: "8.8",
                    onPressed: () {
                      context.go("${AppRouteName.discoveryPage}/${AppRouteName.restaurantDetailPage}");
                    },
                    description: "description",
                  ),
                ],
              ),
            ),

            SizedBox(height: 75.h),
          ],
        ),
      ),
    );
  }
}
