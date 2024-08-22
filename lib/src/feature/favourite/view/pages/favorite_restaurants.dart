import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:go_router/go_router.dart";
import "../../../../core/routes/app_route_name.dart";
import "../../models/card_item_model.dart";
import "../../models/restaurant_card_model.dart";
import "../../services/restaurant_item_service.dart";

class FavoriteRestaurantsPage extends ConsumerStatefulWidget {
  @override
  _FavoriteRestaurantsPageState createState() =>
      _FavoriteRestaurantsPageState();
}

class _FavoriteRestaurantsPageState extends ConsumerState<FavoriteRestaurantsPage> {
  final RestaurantService _restaurantService = RestaurantService();
  Future<List<CardItem>>? _favoriteRestaurantsFuture;

  @override
  void initState() {
    super.initState();
    _favoriteRestaurantsFuture = _fetchFavoriteRestaurants();
  }

  Future<List<CardItem>> _fetchFavoriteRestaurants() async {
    try {
      return await _restaurantService.fetchFavoriteRestaurants();
    } catch (e) {
      // Handle the error by logging it or returning an empty list
      return [];
    }
  }

  void _updateFavoriteStatus(List<CardItem> items, int index, bool isFavorited) {
    setState(() {
      items[index].isFavorited = isFavorited;
      if (!isFavorited) {
        items.removeAt(index);
        _restaurantService.deleteItem(); // Assuming this method deletes the item on the backend.
      }
    });
  }

  @override
  void dispose() {
    // Perform any cleanup if necessary here.
    // For instance, you could cancel any pending requests or timers.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    body: FutureBuilder<List<CardItem>>(
      future: _favoriteRestaurantsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text("An error occurred."));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No favorite restaurants found."));
        } else {
          List<CardItem> items = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CupertinoButton(
                  onPressed: () {
                    context.go(
                      "${AppRouteName.favoritePage}/${AppRouteName.restaurantDetailPage}",
                    );
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
