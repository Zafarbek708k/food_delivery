import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:food_delivery/src/feature/restaurant/widgets/restaraunt_card_widget.dart";
import "package:food_delivery/src/feature/restaurant/widgets/restaraunt_category_horizontal_widget.dart";

import "../../widgets/custom_appbar_widget.dart";

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
          textColor: Colors.black,
          actions: [
            IconButton(icon: Image.asset("assets/images/restaurant_map_icon.png"), onPressed: () {}),
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
                      style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    Text(
                      "Categories",
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    20.horizontalSpace,
                    const HorizontalCategories(),
                    20.horizontalSpace,
                    Text(
                      "All restaurants",
                      style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const RestaurantCard(),
                childCount: 10, // Adjust the number of restaurants as needed
              ),
            ),
          ],
        ),
      );
}
