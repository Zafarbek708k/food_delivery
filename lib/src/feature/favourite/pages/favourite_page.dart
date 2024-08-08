import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:food_delivery/src/feature/favourite/pages/favorite_food_items.dart";
import "package:food_delivery/src/feature/favourite/pages/favorite_restaurants.dart";


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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 10),
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
                    indicatorSize: TabBarIndicatorSize.tab,  // Keeps the indicator size equal to the tab size
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    dividerHeight: 0,
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
      ),
    );
}