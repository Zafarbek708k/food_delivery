import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "food_details_page.dart";
import "../view_model/restaurant_detail_vm.dart";
import "../widgets/restaraunt_food_widget.dart";
import "../model/food_model.dart";
import "order_page.dart";

class RestaurantDetail extends ConsumerWidget {
  const RestaurantDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final foods = ref.watch(foodsProvider);
    final cartNotifier = ref.watch(cartProvider);

    double totalPrice = cartNotifier.calculateTotalPrice();
    bool showButton = totalPrice > 0;

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
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/discovery_fast_delivery.png",
                    fit: BoxFit.cover, // Yoki BoxFit.contain
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "La Pasta House",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Text("An authentic Italian touch and delicious!"),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          SizedBox(width: 4),
                          Text("Excellent 9.5"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.delivery_dining,
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 4),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Delivery in 40-50 min"),
                              Text(
                                "Home (g'uncha)",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text("Change"),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        children: [
                          Icon(Icons.access_time_filled, color: Colors.orange),
                          SizedBox(width: 4),
                          Text("10:00 - 22:00"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...categories.map((category) {
                        final items = foods
                            .where((item) => item.category == category)
                            .toList();
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: const TextStyle(
                                fontSize: 18,
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
                                childAspectRatio: 0.75,
                              ),
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return FoodCard(
                                  item: item,
                                  isAdded: cartNotifier.cartItems.any(
                                    (cartItem) =>
                                        cartItem.foodItem.name == item.name,
                                  ),
                                  quantity: cartNotifier.cartItems
                                      .firstWhere(
                                        (cartItem) =>
                                            cartItem.foodItem.name == item.name,
                                        orElse: () => CartItem(
                                          foodItem: item,
                                          selectedAddOns: [],
                                          quantity: 0,
                                        ),
                                      )
                                      .quantity,
                                  onAdd: () {
                                    cartNotifier.addItem(item);
                                  },
                                  incrementQuantity: () {
                                    cartNotifier.updateQuantity(item, 1);
                                  },
                                  decrementQuantity: () {
                                    cartNotifier.updateQuantity(item, -1);
                                  },
                                  navigateToDetails: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FoodDetailsPage(foodItem: item),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showButton)
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OrderPage(),
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Place Order"),
                    Text("€${totalPrice.toStringAsFixed(2)}"),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}
