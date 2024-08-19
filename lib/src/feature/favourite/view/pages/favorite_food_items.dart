import "package:dio/dio.dart";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";
import "package:go_router/go_router.dart";

import "../../../../core/routes/app_route_name.dart";
import "../../models/card_item_model.dart";
import "../../models/restaurant_card_model.dart";
import "../../services/food_item_service.dart";

class FoodItemsPage extends ConsumerStatefulWidget {
  @override
  _FoodItemsPageState createState() => _FoodItemsPageState();
}

class _FoodItemsPageState extends ConsumerState<FoodItemsPage> {
  final FoodItemService _foodItemService = FoodItemService();

  Future<List<CardItem>> _fetchFoodItems() async {
    try {
      return await _foodItemService.fetchFoodItems();
    } catch (e) {
      throw e;
    }
  }

  void _updateFavoriteStatus(List<CardItem> items, int index, bool isFavorited) {
    setState(() {
      items[index].isFavorited = isFavorited;
      if (!isFavorited) {
        items.removeAt(index);
        FoodItemService().deleteItem();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<CardItem>>(
      future: _fetchFoodItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          var errorMessage =
              "An error occurred while fetching food items.";
          if (snapshot.error is DioException) {
            errorMessage = "Error: ${snapshot.error}";
          }
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorMessage),
                SizedBox(height: 10.h),
                ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text(context.localized.addToOrder));
        } else {
          final items = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CupertinoButton(
                  onPressed: () {
                    context.go(
                        "${AppRouteName.favoritePage}/${AppRouteName.foodDetailPage}");
                  },
                  padding: EdgeInsets.zero,
                  child: FoodItemCard(
                    cardItem: items[index],
                    onFavoriteToggle: (isFavorited) =>
                        _updateFavoriteStatus(items, index, isFavorited),
                  ),
                ),
              ),
            ),
          );
        }
      },
    ),
  );
}
