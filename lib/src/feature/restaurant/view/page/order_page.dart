import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../view_model/restaurant_detail_vm.dart";

class OrderPage extends ConsumerWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartProvider);
    double totalPrice = cartNotifier.calculateTotalPrice();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Order"),
      ),
      body: cartNotifier.cartItems.isEmpty
          ? const Center(
              child: Text("Your cart is empty"),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartNotifier.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartNotifier.cartItems[index];
                      return ListTile(
                        leading: Image.network(cartItem.foodItem.imageUrl),
                        title: Text(cartItem.foodItem.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quantity: ${cartItem.quantity}",
                              style: const TextStyle(fontSize: 14),
                            ),
                            Text(
                              'Add-Ons: ${cartItem.selectedAddOns.map((e) => e.name).join(', ')}',
                              style: const TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                        trailing: Text(
                          "€${cartItem.calculateTotalPrice().toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Total: €${totalPrice.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          // Handle order placement
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Order Placed"),
                              content: const Text("Thank you for your order!"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    cartNotifier.cartItems.clear();
                                    Navigator.pop(context);
                                    Navigator.pop(context);
                                  },
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text("Place Order"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
