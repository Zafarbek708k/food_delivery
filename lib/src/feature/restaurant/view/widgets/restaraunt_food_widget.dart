import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
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
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15.r),
          splashColor: Colors.orange.withOpacity(0.2),
          onTap: navigateToDetails,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.r),
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.r),
                    child: CachedNetworkImage(
                      imageUrl: item.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity.w,
                      height: 138.h,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.error),
                      ),
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
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lF83B01,
                      ),
                    ),
                    Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    SizedBox(
                      height: 30.h,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        item.description,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),
                    if (isAdded)
                      Center(
                        child: Container(
                          height: 40.h,
                          width: 140.w,
                          decoration: BoxDecoration(
                            color: AppColors.lFED8CC,
                            borderRadius: BorderRadius.circular(25.r),
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
                                style: TextStyle(
                                  color: AppColors.lF83B01,
                                  fontSize: 18.sp,
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
                          height: 40.h,
                          width: 140.w,
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
