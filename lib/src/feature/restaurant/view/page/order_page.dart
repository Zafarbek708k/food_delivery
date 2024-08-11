import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "../../../../core/style/app_colors.dart";
import "../../model/food_model.dart";
import "../../view_model/restaurant_detail_vm.dart";
import "../widgets/button_orange.dart";
import "../widgets/restaraunt_food_mini_widget.dart";
import "food_details_page.dart";
class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartProvider);
    final foods = ref.watch(foodsProvider);
    final totalPrice = cartNotifier.calculateTotalPrice();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text("Your order"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.84,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Order items",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (cartNotifier.cartItems.isEmpty)
                      const Center(
                        child: Text("Your cart is empty"),
                      )
                    else
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        itemCount: cartNotifier.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartNotifier.cartItems[index];
                          return Column(
                            children: [
                              SizedBox(
                                height: 110,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          cartItem.foodItem.imageUrl,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartItem.foodItem.name,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            (cartItem.selectedAddOns.isNotEmpty
                                                ? cartItem.selectedAddOns
                                                    .map(
                                                      (e) => "+ ${e.name}",
                                                    )
                                                    .join("\n")
                                                : cartItem
                                                    .foodItem.description),
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: AppColors.lFED8CC,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            child: Row(
                                              children: [
                                                Flexible(
                                                  child: IconButton(
                                                    iconSize: 12,
                                                    icon: const Icon(
                                                      Icons.remove,
                                                    ),
                                                    onPressed: () {
                                                      cartNotifier
                                                          .updateQuantity(
                                                        cartItem.foodItem,
                                                        -1,
                                                      );
                                                    },
                                                    color: AppColors.lF83B01,
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        const BoxConstraints(),
                                                  ),
                                                ),
                                                Text(
                                                  cartItem.quantity.toString(),
                                                  style: const TextStyle(
                                                    color: AppColors.lF83B01,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Flexible(
                                                  child: IconButton(
                                                    iconSize: 12,
                                                    icon: const Icon(Icons.add),
                                                    onPressed: () {
                                                      cartNotifier
                                                          .updateQuantity(
                                                        cartItem.foodItem,
                                                        1,
                                                      );
                                                    },
                                                    color: AppColors.lF83B01,
                                                    padding: EdgeInsets.zero,
                                                    constraints:
                                                        const BoxConstraints(),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            "€${cartItem.calculateTotalPrice().toStringAsFixed(2)}",
                                            style: const TextStyle(
                                              color: AppColors.lF83B01,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Divider(),
                            ],
                          );
                        },
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " €${totalPrice.toStringAsFixed(2)}",
                          style: const TextStyle(
                            color: AppColors.lF83B01,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 15,
                      thickness: 3,
                      color: AppColors.lF96234,
                    ),
                    const Text(
                      "Any else",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 2,
                        mainAxisSpacing: 2,
                        childAspectRatio: 0.46,
                      ),
                      itemCount: foods.length,
                      itemBuilder: (context, index) {
                        final item = foods[index];
                        final cartItem = cartNotifier.cartItems.firstWhere(
                          (cartItem) => cartItem.foodItem.name == item.name,
                          orElse: () => CartItem(
                            foodItem: item,
                            selectedAddOns: [],
                            quantity: 0,
                          ),
                        );
                        return FoodCardMini(
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
                            final updatedQuantity = await Navigator.push<int>(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FoodDetailsPage(),
                              ),
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
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            OrangeButton(
              onPressed: () async {},
              text:
                  "Go to checkout       Total: €${totalPrice.toStringAsFixed(2)}",
            ),
          ],
        ),
      ),
    );
  }
}
