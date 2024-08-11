import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../../core/style/app_colors.dart";
import "../../view_model/restaurant_detail_vm.dart";
import "../widgets/button_orange.dart";

class FoodDetailsPage extends ConsumerWidget {
  const FoodDetailsPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartNotifier = ref.watch(cartProvider);
    final foodItem = cartNotifier.currentFoodItem;
    final quantity = cartNotifier.getQuantityForItem(foodItem);
    final isFavorite = cartNotifier.isFavorite;
    final addOnsSelection = {
      for (final addOn in foodItem.addOns)
        addOn: cartNotifier.isAddOnSelected(foodItem, addOn),
    };
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              foodItem.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  foodItem.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  ),
                  onPressed: () {
                    cartNotifier.toggleFavorite();
                  },
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              foodItem.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              "€ ${foodItem.price}",
              style: const TextStyle(
                color: AppColors.lF83B01,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            const Text(
              "Add more:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              children: addOnsSelection.keys
                  .map(
                    (addOn) => CheckboxListTile(
                      title: Text(
                        "${addOn.name} (+€${addOn.price.toStringAsFixed(2)})",
                      ),
                      value: addOnsSelection[addOn],
                      onChanged: (bool? value) {
                        final updatedSelection = {
                          ...addOnsSelection,
                          addOn: value ?? false,
                        };
                        final selectedAddOns = updatedSelection.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList();
                        cartNotifier.updateAddOns(foodItem, selectedAddOns);
                      },
                    ),
                  )
                  .toList(),
            ),
            const Divider(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,
                  width: 110,
                  decoration: BoxDecoration(
                    color: AppColors.lFED8CC,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: IconButton(
                          iconSize: 25,
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            if (quantity > 1) {
                              cartNotifier.updateQuantity(foodItem, -1);
                            } else {
                              cartNotifier.updateQuantity(foodItem, -1);
                              Navigator.pop(context);
                            }
                          },
                          color: AppColors.lF83B01,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(
                          color: AppColors.lF83B01,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Flexible(
                        child: IconButton(
                          iconSize: 25,
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            if (quantity == 0) {
                              cartNotifier.addItem(foodItem);
                            } else {
                              cartNotifier.updateQuantity(foodItem, 1);
                            }
                          },
                          color: AppColors.lF83B01,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: OrangeButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (quantity == 0) {
                        cartNotifier.addItem(foodItem);
                      }
                    },
                    text: "Add to order",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
