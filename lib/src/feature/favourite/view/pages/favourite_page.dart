import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "favorite_food_items.dart";
import "favorite_restaurants.dart";

class FavouritePage extends ConsumerStatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends ConsumerState<FavouritePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: REdgeInsets.only(top: 30, left: 10, right: 10),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 55,
                  width: double.maxFinite,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0.5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: TabBar(
                      controller: _tabController,
                      indicator: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      dividerHeight: 0,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      tabs: [
                        Tab(
                          text: context.localized.foodItems,
                          height: 20,
                        ),
                        Tab(
                          text: context.localized.restaurants,
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      FoodItemsPage(),
                      FavoriteRestaurantsPage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
