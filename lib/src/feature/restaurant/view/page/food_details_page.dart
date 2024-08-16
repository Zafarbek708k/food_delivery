import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/constants/context_extension.dart";

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
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: foodItem.imageUrl,
              height: 200.h,
              width: double.infinity.w,
              fit: BoxFit.cover,
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  const Center(child: Icon(Icons.error)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  foodItem.name,
                  style: TextStyle(
                    fontSize: 24.sp,
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
            Text(
              foodItem.description,
              style: TextStyle(fontSize: 16.sp),
            ),
            Text(
              "€ ${foodItem.price.toStringAsFixed(0)}",
              style: TextStyle(
                color: AppColors.lF83B01,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(),
            Text(
             context.localized.addMore,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              height: MediaQuery.of(context).size.height.h * 0.15,
              child: SingleChildScrollView(
                child: Column(
                  children: addOnsSelection.keys
                      .map(
                        (addOn) => CheckboxListTile(
                          title: Text(
                            "${addOn.name} (+€${addOn.price.toStringAsFixed(0)})",
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
              ),
            ),
            const Divider(),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40.h,
                  width: 110.w,
                  decoration: BoxDecoration(
                    color: AppColors.lFED8CC,
                    borderRadius: BorderRadius.circular(20.r),
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
                        style: TextStyle(
                          color: AppColors.lF83B01,
                          fontSize: 20.sp,
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
                  width: 180.w,
                  height: 40.h,
                  child: OrangeButton(
                    onPressed: () {
                      Navigator.pop(context);
                      if (quantity == 0) {
                        cartNotifier.addItem(foodItem);
                      }
                    },
                    text: context.localized.addToOrder,
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
