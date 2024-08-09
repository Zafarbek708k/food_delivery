import "package:flutter/material.dart";

import "../model/food_model.dart";

class FoodCard extends StatelessWidget {
  final FoodItem item;
  final bool isAdded;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;
  final VoidCallback navigateToDetails;

  const FoodCard({
    required this.item,
    required this.isAdded,
    required this.quantity,
    required this.onAdd,
    required this.incrementQuantity,
    required this.decrementQuantity,
    required this.navigateToDetails,
    super.key,
  });

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: navigateToDetails,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "${item.price.toStringAsFixed(2)} €",
                      style: const TextStyle(color: Colors.orange),
                    ),
                    const SizedBox(height: 4),
                    if (isAdded)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decrementQuantity,
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: incrementQuantity,
                          ),
                        ],
                      )
                    else
                      ElevatedButton(
                        onPressed: onAdd,
                        child: const Text("Add"),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
