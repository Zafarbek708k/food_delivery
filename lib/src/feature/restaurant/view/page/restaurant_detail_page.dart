import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:go_router/go_router.dart";

import "../../../../core/routes/app_route_name.dart";
import "../../../../core/style/app_colors.dart";
import "../../model/food_model.dart";
import "../../view_model/restaurant_detail_vm.dart";
import "../widgets/button_orange.dart";
import "../widgets/restaraunt_food_widget.dart";

class RestaurantDetail extends ConsumerWidget {
  const RestaurantDetail({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodsProvider);
    final cartNotifier = ref.watch(cartProvider);
    final isFavorite = cartNotifier.isFavorite;
    final totalPrice = cartNotifier.calculateTotalPrice();
    final showButton = totalPrice > 0;
    List<String> getCategories() =>
        foods.map((item) => item.category).toSet().toList();
    final categories = getCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text("La Pasta House"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3.h,
                  width: MediaQuery.of(context).size.width.w,
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://assets.bonappetit.com/photos/61ba70da510874520d257b78/16:9/w_1920,c_limit/LEDE_Oma's%20Hideaway,%20Credit%20Christine%20Dong.jpg",
                    height: 150.h,
                    width: double.infinity.w,
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                        const Center(child: Icon(Icons.error)),
                  ),
                ),
                Padding(
                  padding: REdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "La Pasta House",
                            style: TextStyle(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : null,
                            ),
                            onPressed: () {
                              cartNotifier.toggleFavorite();
                            },
                            constraints: const BoxConstraints(),
                          ),
                        ],
                      ),
                      const Text("An authentic Italian touch and delicious!"),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 4.w),
                          const Text("Excellent 9.5"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.delivery_dining,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 4.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Delivery in 40-50 min"),
                              Text(
                                "Home (g'uncha)",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {
                              context.go(
                                "${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}/${AppRouteName.mapDeliveryPage}",
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lFED8CC,
                            ),
                            child: const Text(
                              "Change",
                              style: TextStyle(
                                color: AppColors.lF96234,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.access_time_filled,
                            color: Colors.orange,
                          ),
                          SizedBox(width: 4.w),
                          const Text("10:00 - 22:00"),
                        ],
                      ),
                      const SizedBox(height: 20),
                      ...categories.map((category) {
                        final items = foods
                            .where((item) => item.category == category)
                            .toList();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            const Divider(),
                            Text(
                              category,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            GridView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 0.53,
                              ),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                final cartItem =
                                    cartNotifier.cartItems.firstWhere(
                                  (cartItem) =>
                                      cartItem.foodItem.name == item.name,
                                  orElse: () => CartItem(
                                    foodItem: item,
                                    selectedAddOns: [],
                                    quantity: 0,
                                  ),
                                );

                                return FoodCard(
                                  item: item,
                                  isAdded: cartItem.quantity > 0,
                                  quantity: cartItem.quantity,
                                  onAdd: () {
                                    cartNotifier.addItem(item);
                                  },
                                  incrementQuantity: () {
                                    cartNotifier.updateQuantity(item, 1);
                                  },
                                  decrementQuantity: () {
                                    cartNotifier.updateQuantity(item, -1);
                                  },
                                  navigateToDetails: () async {
                                    cartNotifier.setCurrentFoodItem(item);
                                    final updatedQuantity =
                                        await context.push<int>(
                                      "${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}/${AppRouteName.foodDetailPage}",
                                    );
                                    if (updatedQuantity != null &&
                                        updatedQuantity != cartItem.quantity) {
                                      cartNotifier.updateQuantity(
                                        item,
                                        updatedQuantity - cartItem.quantity,
                                      );
                                    }
                                  },
                                );
                              },
                            ),
                          ],
                        );
                      }),
                      if (showButton) const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showButton)
            Positioned(
              bottom: 10,
              left: 16,
              right: 16,
              child: OrangeButton(
                onPressed: () async {
                  final defaultFoodItem = foods.isNotEmpty ? foods.first : null;
                  if (defaultFoodItem != null) {
                    cartNotifier.setCurrentFoodItem(defaultFoodItem);
                    final updatedQuantity = await context.push<int>(
                      "${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}/${AppRouteName.orderPage}",
                    );
                    if (updatedQuantity != null) {
                      cartNotifier.updateQuantity(
                        defaultFoodItem,
                        updatedQuantity -
                            cartNotifier.getQuantityForItem(defaultFoodItem),
                      );
                    }
                  }
                },
                text: "Place Order: €${totalPrice.toStringAsFixed(2)}",
              ),
            ),
        ],
      ),
    );
  }
}
