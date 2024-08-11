import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../model/food_model.dart";

class RestaurantVm extends ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  void addItem(FoodItem item) {
    _cartItems.add(
      CartItem(foodItem: item, selectedAddOns: item.addOns, quantity: 1),
    );
    notifyListeners();
  }

  void removeItem(FoodItem item) {
    _cartItems.removeWhere((cartItem) => cartItem.foodItem.name == item.name);
    notifyListeners();
  }

  void updateQuantity(FoodItem item, int delta) {
    _cartItems = _cartItems
        .map((cartItem) {
          if (cartItem.foodItem.name == item.name) {
            final updatedQuantity = cartItem.quantity + delta;
            if (updatedQuantity <= 0) {
              return null;
            }
            return cartItem.copyWith(quantity: updatedQuantity);
          }
          return cartItem;
        })
        .whereType<CartItem>()
        .toList();
    notifyListeners();
  }

  double calculateTotalPrice() => _cartItems.fold(
        0,
        (total, cartItem) => total + cartItem.calculateTotalPrice(),
      );
}

final cartProvider =
    ChangeNotifierProvider<RestaurantVm>((ref) => RestaurantVm());

final foodsProvider = Provider<List<FoodItem>>((ref) => foodsList);
List<FoodItem> foodsList = [
  FoodItem(
    name: "Spaghetti",
    category: "Pasta",
    imageUrl: "https://picsum.photos/250?image=1",
    description: "Delicious spaghetti with marinara sauce",
    price: 12.99,
    addOns: [
      AddOn(name: "Extra cheese", price: 1.99),
      AddOn(name: "Garlic bread", price: 2.99),
    ],
  ),
  FoodItem(
    name: "Lasagna",
    category: "Pasta",
    imageUrl: "https://picsum.photos/250?image=2",
    description: "Classic beef lasagna",
    price: 15.99,
    addOns: [
      AddOn(name: "Extra cheese", price: 1.99),
      AddOn(name: "Salad", price: 3.99),
    ],
  ),
  FoodItem(
    name: "nima",
    category: "drink",
    imageUrl: "https://picsum.photos/250?image=3",
    description: "Classic beef lasagna",
    price: 15.99,
    addOns: [
      AddOn(name: "Extra cheese", price: 1.99),
      AddOn(name: "Salad", price: 3.99),
    ],
  ),
  FoodItem(
    name: "Coke",
    category: "Drink",
    imageUrl: "https://picsum.photos/250?image=3",
    description: "Refreshing Coca-Cola",
    price: 1.99,
    addOns: [],
  ),
];
