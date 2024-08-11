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
import "../widgets/restaraunt_food_mini_widget.dart";

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
        padding: REdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.75.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Order items",
                      style: TextStyle(
                        fontSize: 18.sp,
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
                        padding: REdgeInsets.all(16),
                        itemCount: cartNotifier.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = cartNotifier.cartItems[index];
                          return Column(
                            children: [
                              SizedBox(
                                height: 110.h,
                                width: MediaQuery.of(context).size.width.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        child: CachedNetworkImage(
                                          imageUrl: cartItem.foodItem.imageUrl,
                                          height: 100.h,
                                          width: 100.w,
                                          fit: BoxFit.cover,
                                          placeholder: (context, url) =>
                                              const Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                            child: Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5.w),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            cartItem.foodItem.name,
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(height: 4.h),
                                          Text(
                                            (cartItem.selectedAddOns.isNotEmpty
                                                ? cartItem.selectedAddOns
                                                    .map(
                                                      (e) => "+ ${e.name}",
                                                    )
                                                    .join("\n")
                                                : cartItem
                                                    .foodItem.description),
                                            style: TextStyle(fontSize: 14.sp),
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
                                            height: 30.h,
                                            width: 70.w,
                                            decoration: BoxDecoration(
                                              color: AppColors.lFED8CC,
                                              borderRadius:
                                                  BorderRadius.circular(20.r),
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
                                                  style: TextStyle(
                                                    color: AppColors.lF83B01,
                                                    fontSize: 10.sp,
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
                                            "€${cartItem.calculateTotalPrice().toStringAsFixed(0)}",
                                            style: TextStyle(
                                              color: AppColors.lF83B01,
                                              fontSize: 15.sp,
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
                        Text(
                          "Total:",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " €${totalPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            color: AppColors.lF83B01,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 15.h,
                      thickness: 3,
                      color: AppColors.lF96234,
                    ),
                    Text(
                      "Any else",
                      style: TextStyle(
                        fontSize: 18.sp,
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
                        childAspectRatio: 0.41,
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
                            final updatedQuantity = await context.push<int>(
                              "${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}/${AppRouteName.orderPage}/${AppRouteName.foodDetailPage}",
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
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            ),
            OrangeButton(
              onPressed: () async {
                context.go(
                  "${AppRouteName.restaurantPage}/${AppRouteName.restaurantDetailPage}/${AppRouteName.orderPage}/${AppRouteName.mapDeliveryPage}",
                );
              },
              text:
                  "Go to checkout       Total: €${totalPrice.toStringAsFixed(0)}",
            ),
          ],
        ),
      ),
    );
  }
}
