import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:food_delivery/src/core/routes/app_route_name.dart";
import "package:go_router/go_router.dart";
import "../../../widgets/custom_appbar_widget.dart";

import "../widgets/restaraunt_card_widget.dart";
import "../widgets/restaraunt_category_horizontal_widget.dart";

class RestaurantsPage extends ConsumerWidget {
  const RestaurantsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: AppBarWidget(
          bcgColor: Colors.white,
          appBarText: "Xurshid Umarov",
          fontWeight: FontWeight.w600,
          textColor: Colors.black,
          actions: [
            IconButton(
              icon: Image.asset(
                "assets/images/restaurant_map_icon1.png",
                height: 35,
                width: 35,
              ),
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
                padding: REdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Restaurants",
                      style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Categories",
                      style: context.theme.textTheme.bodyLarge?.copyWith(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    20.horizontalSpace,
                    const HorizontalCategories(),
                    20.horizontalSpace,
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
                  },
                ),
                childCount: 10,
              ),
            ),
          ],
        ),
      );
}
