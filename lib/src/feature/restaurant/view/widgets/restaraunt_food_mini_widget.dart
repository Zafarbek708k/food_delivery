import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:food_delivery/src/core/style/app_colors.dart";

import "../../model/food_model.dart";
import "button_orange.dart";

class FoodCardMini extends StatelessWidget {
  final FoodItem item;
  final bool isAdded;
  final int quantity;
  final VoidCallback onAdd;
  final VoidCallback incrementQuantity;
  final VoidCallback decrementQuantity;
  final VoidCallback navigateToDetails;

  const FoodCardMini({
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
                      width: double.infinity.w,
                      height: 138.h,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
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
                    SizedBox(
                      height: 30.h,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        item.name,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   height: 30,
                    //   child: Text(
                    //     overflow: TextOverflow.ellipsis,
                    //     maxLines: 2,
                    //     item.description,
                    //     style: const TextStyle(
                    //       fontSize: 10,
                    //       fontWeight: FontWeight.w400,
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(height: 15),
                    if (isAdded)
                      Center(
                        child: Container(
                          height: 40.h,
                          width: 110.w,
                          decoration: BoxDecoration(
                            color: AppColors.lFED8CC,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: decrementQuantity,
                                color: AppColors.lF83B01,
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                              ),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  color: AppColors.lF83B01,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
