import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:food_delivery/src/feature/restaurant/view/widgets/restaraunt_card_widget.dart";
import "package:food_delivery/src/feature/restaurant/view/widgets/restaraunt_category_horizontal_widget.dart";
import "package:go_router/go_router.dart";

import "../../../widgets/custom_appbar_widget.dart";

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  RestaurantsPageState createState() => RestaurantsPageState();
}

class RestaurantsPageState extends State<RestaurantsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBarWidget(
          bcgColor: Colors.white,
          appBarText: "Xurshid Umarov",
          fontWeight: FontWeight.w600,
          textColor: Colors.black,
          actions: [
            IconButton(
              icon: Image.asset("assets/images/restaurant_map_icon1.png"),
              onPressed: () {
                context.go("${AppRouteName.restaurantPage}/${AppRouteName.mapDeliveryPage}");
                log("message");
              },
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Restaurants",
                    //   style: context.theme.textTheme.bodyLarge?.copyWith(
                    //     fontSize: 24.sp,
                    //     fontWeight: FontWeight.bold,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    Text(
                      "Categories",
                      style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    10.verticalSpace,
                    const HorizontalCategories(),
                    Text(
                      "All restaurants",
                      style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => RestaurantCard(
                  onTap: () {
                    context.go("${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}");
                    log("RestaurantCard : $index");
                  },
                ),
                childCount: 10,
              ),
            ),
          ],
        ),
      );
}
