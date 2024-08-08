import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:food_delivery/src/feature/favourite/pages/favorite_food_items.dart";
import "package:food_delivery/src/feature/favourite/pages/favorite_restaurants.dart";
import "package:food_delivery/src/feature/home/pages/home_page.dart";

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> with SingleTickerProviderStateMixin {
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: SizedBox(
                height: 45,
                width: double.maxFinite,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Search",
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      backgroundColor: Colors.white10,
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
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
                  indicatorPadding: EdgeInsets.symmetric(horizontal: 5.w),  // Adjust the padding to increase width
                  indicatorSize: TabBarIndicatorSize.tab,  // Keeps the indicator size equal to the tab size
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  tabs: const [
                    Tab(text: "  Food Items  ",
                    height: 20,),
                    Tab(text: "  Restaurants  ",
                    height: 20,),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
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
    );
}