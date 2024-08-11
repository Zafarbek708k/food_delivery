import "package:flutter/material.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

import "../../model/food_model.dart";
import "button_orange.dart";

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
  Widget build(BuildContext context) => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          splashColor: Colors.orange.withOpacity(0.2),
          onTap: navigateToDetails,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      item.imageUrl,
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 138,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${item.price.toStringAsFixed(0)} €",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lF83B01,
                      ),
                    ),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: 30,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        item.description,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    if (isAdded)
                      Center(
                        child: Container(
                          height: 40,
                          width: 140,
                          decoration: BoxDecoration(
                            color: AppColors.lFED8CC,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Decrement Button
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: decrementQuantity,
                                color: AppColors.lF83B01,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              // Quantity Display
                              Text(
                                quantity.toString(),
                                style: const TextStyle(
                                  color: AppColors.lF83B01,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Increment Button
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: incrementQuantity,
                                color: AppColors.lF83B01,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 140,
                          child: OrangeButton(
                            onPressed: () {
                              onAdd();
                              navigateToDetails();
                            },
                            text: "Add",
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
