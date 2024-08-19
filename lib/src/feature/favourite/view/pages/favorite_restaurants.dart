import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
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

class _FavoriteRestaurantsPageState
    extends ConsumerState<FavoriteRestaurantsPage> {
  final RestaurantService _restaurantService = RestaurantService();
  List<CardItem> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchFavoriteRestaurants();
  }

  Future<void> _fetchFavoriteRestaurants() async {
    try {
      List<CardItem> fetchedItems =
          await _restaurantService.fetchFavoriteRestaurants();
      setState(() {
        items = fetchedItems;
        isLoading = false;
      });
    } catch (e) {
      // Handle error here
      setState(() {
        isLoading = false;
      });
    }
  }

  void _updateFavoriteStatus(int index, bool isFavorited) {
    setState(() {
      items[index].isFavorited = isFavorited;
      if (!isFavorited) {
        items.removeAt(index);
        RestaurantService().deleteItem();
      }
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            : items.isEmpty
                ? const Center(child: Text("No favorite restaurants found."))
                : Padding(
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
                          padding: REdgeInsets.all(0),
                          child: FoodItemCard(
                            cardItem: items[index],
                            onFavoriteToggle: (isFavorited) =>
                                _updateFavoriteStatus(index, isFavorited),
                          ),
                        ),
                      ),
                    ),
                  ),
      );
}
