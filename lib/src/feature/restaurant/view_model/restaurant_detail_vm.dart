import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../model/food_model.dart";

class RestaurantDetailVm extends ChangeNotifier {
  List<CartItem> _cartItems = [];
  late FoodItem? _currentFoodItem;
  bool _isFavorite = false; // Track favorite status with a bool
  List<CartItem> get cartItems => _cartItems;
  FoodItem get currentFoodItem => _currentFoodItem!;
  bool get isFavorite => _isFavorite;
  void setCurrentFoodItem(FoodItem item) {
    _currentFoodItem = item;
    // Reset favorite status or determine based on other logic if necessary
    _isFavorite = false;
  }

  void toggleFavorite() {
    _isFavorite = !_isFavorite;
    notifyListeners();
  }

  int getQuantityForItem(FoodItem item) {
    final cartItem = _cartItems.firstWhere(
      (cartItem) => cartItem.foodItem.name == item.name,
      orElse: () => CartItem(foodItem: item, selectedAddOns: [], quantity: 0),
    );
    return cartItem.quantity;
  }

  void addItem(FoodItem item) {
    _cartItems.add(
      CartItem(foodItem: item, selectedAddOns: item.addOns, quantity: 1),
    );
    notifyListeners();
  }

  void updateQuantity(FoodItem foodItem, int change) {
    final index = cartItems.indexWhere((item) => item.foodItem == foodItem);
    if (index != -1) {
      final cartItem = cartItems[index];
      final newQuantity = cartItem.quantity + change;

      if (newQuantity > 0) {
        cartItems[index] = cartItem.copyWith(quantity: newQuantity);
      } else {
        cartItems.removeAt(index);
      }

      notifyListeners();
    }
  }

  void updateAddOns(FoodItem item, List<AddOn> selectedAddOns) {
    _cartItems = _cartItems.map((cartItem) {
      if (cartItem.foodItem.name == item.name) {
        return cartItem.copyWith(selectedAddOns: selectedAddOns);
      }
      return cartItem;
    }).toList();
    notifyListeners();
  }

  double calculateTotalPrice() => _cartItems.fold(
        0,
        (total, cartItem) => total + cartItem.calculateTotalPrice(),
      );
  bool isAddOnSelected(FoodItem foodItem, AddOn addOn) {
    final cartItem = cartItems.firstWhere(
      (item) => item.foodItem == foodItem,
      orElse: () =>
          CartItem(foodItem: foodItem, selectedAddOns: [], quantity: 0),
    );
    return cartItem.selectedAddOns.contains(addOn);
  }
}

final cartProvider =
    ChangeNotifierProvider<RestaurantDetailVm>((ref) => RestaurantDetailVm());
final foodsProvider = Provider<List<FoodItem>>((ref) => foodsList);
